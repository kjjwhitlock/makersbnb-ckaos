require 'coveralls'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

require_relative '../makersbnb'

Capybara.app = MakersBnb
