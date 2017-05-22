# model_2_factory-rails

[![Gem Version](https://badge.fury.io/rb/model_2_factory-rails.svg)](https://rubygems.org/gems/model_2_factory-rails)
[![Downloads](https://img.shields.io/gem/dt/model_2_factory-rails.svg)](https://rubygems.org/gems/model_2_factory-rails)
[![Build Status](https://travis-ci.org/eendroroy/model_2_factory-rails.svg?branch=master)](https://travis-ci.org/eendroroy/model_2_factory-rails) 
[![Code Climate](https://codeclimate.com/github/eendroroy/model_2_factory-rails/badges/gpa.svg)](https://codeclimate.com/github/eendroroy/model_2_factory-rails)
[![Contributors](https://img.shields.io/github/contributors/eendroroy/model_2_factory-rails.svg)](CONTRIBUTORS.md)


Factory model class generator for rails model class.

## Description

Generate factory model class from rails active record class for rails-rspec test code.

### Prerequisites

Require following gem to be included in your gem file:
 
 - factory_girl_rails
```
factory_girl_rails
```

### Installing

Add this line to your application's Gemfile:

```
gem 'model_2_factory-rails'

```
And then execute:

```
$ bundle

```
Or install it globally in your system:

```
$ gem install model_2_factory-rails

```

## Usage

To generate factory class for your existing model class

```
$ bundle exec factory_gen your_model_name
```

## Contributing

Bug reports and pull requests are welcome on GitHub at [model_2_factory-rails repository](https://github.com/eendroroy/model_2_factory-rails). 
This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Authors

* **Indrajit Roy** - *Initial work* - [eendroroy](https://github.com/eendroroy)

See also the list of [contributors](CONTRIBUTORS.md) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details