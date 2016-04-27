# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_print_invoice'
  s.version     = '2.0.0'
  s.summary     = 'Print invoices from a spree order'
  s.homepage    = 'https://github.com/spree/spree_print_invoice'

  s.required_ruby_version = '>= 1.8.7'

  s.files        = Dir['README.md', 'lib/**/*', 'app/**/*', 'config/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.authors      = 'Spree Community'

  s.add_dependency('prawn', '1.0.0')
  s.add_dependency('solidus', '~> 1.0')
  s.add_dependency 'deface'

  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'sqlite3'
end
