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
  s.required_ruby_version = '>= 2.5'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  s.files = files.grep_v(%r{^(test|spec|features)/})
  s.test_files = files.grep(%r{^(test|spec|features)/})
  s.bindir = 'exe'
  s.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'prawn', '1.0.0'
  s.add_dependency 'solidus_core', ['>= 2.0.0', '< 5']
  s.add_dependency 'solidus_support', '~> 0.8'

  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'solidus_dev_support', '~> 2.7'
end
