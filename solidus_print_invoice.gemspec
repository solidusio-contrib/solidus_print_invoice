# frozen_string_literal: true

$:.push File.expand_path('lib', __dir__)
require 'solidus_print_invoice/version'

Gem::Specification.new do |s|
  s.name = 'solidus_print_invoice'
  s.version = SolidusPrintInvoice::VERSION
  s.summary = 'Print invoices from a spree order'
  s.description = \
    'This extension provides a "Print Invoice" button on the ' \
    'Admin Orders view screen which generates a PDF of the order details.'
  s.license = 'BSD-3-Clause'

  s.authors = 'Spree & Solidus Community'
  s.email = 'contact@solidus.io'
  s.homepage = 'https://github.com/solidusio-contrib/solidus_print_invoice'

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage if s.homepage
    s.metadata["source_code_uri"] = s.homepage if s.homepage
    # s.metadata["changelog_uri"] = 'TODO'
  end

  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir['spec/**/*']
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 3.1']
  s.add_dependency 'solidus_support', '~> 0.5'
  s.add_dependency 'deface'
  s.add_dependency 'prawn', '1.0.0'
  s.add_dependency 'solidus', ['>= 1.0', '< 3.1']

  s.add_development_dependency 'solidus_dev_support'
end
