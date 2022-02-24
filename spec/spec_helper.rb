ENV['RACK_ENV'] = 'test'

require_relative './setup_test_database'

ENV['ENVIRONMENT'] = 'test'

# require our Sinatra app file
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), 'features', 'web_helpers.rb')

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'pg'
require_relative './makersbnb_manager_test'
require './spec/database_helpers'
require 'simplecov'
require 'simplecov-console'

# tell Capybara about the app class

Capybara.app = Makersbnb

ENV['ENVIRONMENT'] = 'test' 

RSpec.configure do |config|
  config.before(:each) do
    makersbnb_manager_test
  end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
