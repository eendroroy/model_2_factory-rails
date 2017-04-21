require 'model_2_factory/rails/version'

module Model2Factory
  module Rails
    def self.rails_test
      "model_2_factory => factory_gen <== #{ARGV}"
    end
  end
end
