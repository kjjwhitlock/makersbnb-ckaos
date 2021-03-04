require 'coveralls'
Coveralls.wear!

require_relative 'setup_database'
require_relative 'database_helper'
require_relative './features/helpers'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'
require 'pg'

require_relative '../makersbnb'

BCrypt::Engine.cost = 1

Capybara.app = MakersBnb

RSpec.configure do |config|

  # config.before(:each) { Rake::Task['test_database_setup'].execute }
  config.before(:each) do
    clear_database
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
