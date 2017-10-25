lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'solidus_print_invoice/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_print_invoice'
  s.version     = Spree::PrintInvoice::VERSION
  s.summary     = 'Print invoices from a spree order'
  s.homepage    = 'https://github.com/solidusio-contrib/solidus_print_invoice'

  s.required_ruby_version = '>= 1.9.3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.authors      = 'Spree & Solidus Community'

  s.add_dependency 'prawn', '1.0.0'
  s.add_dependency 'solidus', ['>= 1.0', '< 3']
  s.add_dependency "solidus_support"
  s.add_dependency 'deface'

  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'ffaker'
end
