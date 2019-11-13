# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
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

  s.add_dependency 'deface'
  s.add_dependency 'prawn', '2.2.2'
  s.add_dependency 'solidus', ['>= 1.0', '< 3']
  s.add_dependency "solidus_support"

  s.add_development_dependency 'solidus_extension_dev_tools'
end
