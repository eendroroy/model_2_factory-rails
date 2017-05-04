module Model2Factory
  DEFAULTS = {
    integer: 1,
    bigint: 1,
    numeric: 1,
    decimal: 123.456,
    float: 123.456,
    string: "'MyString'",
    text: "'MyText'",
    datetime: "'#{Time.now}'",
    timestamp: "'#{Time.now.getutc.to_i}'",
    boolean: true
  }.freeze

  def self.invoke
    create_factory(ARGV[0].to_s)
  end

  def self.create_factory(name)
    lines = []
    Object.const_get(name).columns.each do |col|
      next if %w[updated_at created_at id].include? col.name
      lines << "    #{col.name} #{DEFAULTS[col.type.to_sym]}\n"
    end
    write_to_file(name, lines)
    exit(0)
  rescue NameError
    warn_not_found name
    exit(1)
  end

  def self.create_factory_file(name)
    File.open(
      "#{factory_dir}/#{name.underscore.pluralize}_#{factory_suffix}.rb",
      File::RDWR | File::CREAT | File::TRUNC,
      0o644
    )
  end

  def self.write_to_file(name, lines)
    create_factory_dir(factory_dir)
    factory = create_factory_file(name)
    factory.write "FactoryGirl.define do\n  factory :#{name.underscore} do\n"
    lines.each do |line|
      factory.write line
    end
    factory.write "  end\nend\n"
    factory.close
  end

  def self.warn_not_found(name)
    if name == ''
      puts 'Provide a Model name ...'
    else
      puts "Model '#{name}' not found."
    end
    puts 'Available Models :'

    Dir['app/models/**/*.rb'].map do |f|
      puts "==> #{f.chomp('.rb')[f.rindex('/') + 1..f.length].camelize}"
    end
  end

  def self.factory_dir
    if Rails.application.config.generators.factory_girl[:dir].nil?
      'spec/factories'
    else
      Rails.application.config.generators.factory_girl[:dir]
    end
  end

  def self.factory_suffix
    if Rails.application.config.generators.factory_girl[:suffix].nil?
      'factory'
    else
      Rails.application.config.generators.factory_girl[:suffix]
    end
  end

  def self.create_factory_dir(dirname)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
  end

  class << self
    private :create_factory_dir
    private :create_factory
    private :write_to_file
    private :warn_not_found
    private :factory_dir
    private :factory_suffix
  end
end
