require 'model_2_factory/rails/version'
require 'model_2_factory/core/model_2_factory'

module Model2Factory
  module Rails
    def self.invoke
      create_factory(ARGV[0].to_s)
    end

    def self.create_factory(name)
      lines = []
      Object.const_get(name).columns.each do |col|
        next if %w(updated_at created_at id).include? col.name
        lines << "    #{col.name} #{DEFAULTS[col.type.to_sym]}\n"
      end
      write_to_file lines
    rescue NameError
      warn_not_found name
    end

    def self.write_to_file(lines)
      factory = File.open("spec/factories/#{name.underscore.pluralize}_factory.rb", File::RDWR|File::CREAT|File::TRUNC, 0644)
      factory.write "FactoryGirl.define do\n  factory :#{name.underscore} do\n"
      lines.each do |line|
        factory.write line
      end
      factory.write "  end\nend\n"
      factory.close
    end

    def self.warn_not_found(name)
      puts "Model '#{name}' not found."
      puts 'Available Models :'

      Dir['app/models/**/*.rb'].map do |f|
        puts "==> #{f.chomp('.rb')[f.rindex('/') + 1..f.length].camelize}"
      end
    end

    class << self
      private :create_factory
      private :write_to_file
      private :warn_not_found
    end
  end
end
