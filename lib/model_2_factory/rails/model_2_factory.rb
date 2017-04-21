require 'model_2_factory/rails/version'

module Model2Factory
  module Rails
    def self.rails_test
      print_attributes(ARGV[0].to_s)
    end

    def self.print_attributes(name)
      Object.const_get(name).columns.each do |col|
        next if col == 'updated_at' || col == 'created_at'
        puts "#{col.name}:#{col.type}"
      end
    rescue NameError
      warn_not_found name
    end

    def self.warn_not_found(name)
      puts "Model '#{name}' not found."
      puts 'Available Models :'

      Dir['app/models/**/*.rb'].map do |f|
        puts "\t#{f.chomp('.rb')[f.rindex('/') + 1..f.length].camelize}"
      end
    end

    class << self
      private :print_attributes
      private :warn_not_found
    end
  end
end
