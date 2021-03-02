require 'coveralls'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative '../lib/database_connection'
require_relative '../makersbnb'

Capybara.app = MakersBnb

RSpec.configure do |config|

  config.before(:suite){setup_database}

end
