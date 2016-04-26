ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb", __FILE__)

require "rspec/rails"
require 'capybara/poltergeist'
require 'database_cleaner'
require 'factory_girl_rails'
require 'ffaker'
require 'pry'

require 'spree/testing_support/factories'

unless ENV['USE_SELENIUM']
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, timeout: 60)
  end
  Capybara.javascript_driver = :poltergeist
end

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Capybara::DSL, type: :feature
  config.infer_spec_type_from_file_location!

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = false
  config.example_status_persistence_file_path = "tmp/failed_examples.txt"
  config.disable_monkey_patching!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    if RSpec.current_example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end

    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
