require 'coveralls'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'

require_relative '../makersbnb'

Capybara.app = MakersBnb

RSpec.configure do |config|

  # config.before(:each) { Rake::Task['test_database_setup'].execute }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
