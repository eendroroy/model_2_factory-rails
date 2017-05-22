# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'model_2_factory/version'

Gem::Specification.new do |spec|
  spec.name          = 'model_2_factory-rails'
  spec.version       = Model2Factory::VERSION
  spec.authors       = ['indrajit']
  spec.email         = ['eendroroy@gmail.com']

  spec.summary       = ''
  spec.description   = ''
  spec.homepage      = 'https://github.com/eendroroy/model_2_factory-rails'
  spec.license       = 'MIT'

  unless spec.respond_to?(:metadata)
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'

  version_string = ['>= 3.0']

  spec.add_runtime_dependency :activesupport, version_string
  spec.add_runtime_dependency :actionpack,    version_string
  spec.add_runtime_dependency :railties,      version_string

  spec.add_dependency 'colorize'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
