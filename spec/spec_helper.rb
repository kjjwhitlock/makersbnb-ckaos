require 'coveralls'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'rspec'
require 'rake'

require_relative '../makersbnb'

Capybara.app = MakersBnb
