ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment.rb", __FILE__)

require "rspec/rails"

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = false
  config.example_status_persistence_file_path = "tmp/failed_examples.txt"
  config.disable_monkey_patching!
end
