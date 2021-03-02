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
  config.before(:suite) { setup_database }

  config.before(:each) do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("TRUNCATE users RESTART IDENTITY;")
  end
end
