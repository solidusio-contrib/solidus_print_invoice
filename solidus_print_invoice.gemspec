# frozen_string_literal: true

require_relative 'lib/solidus_print_invoice/version'

Gem::Specification.new do |spec|
  spec.name = 'solidus_print_invoice'
  spec.version = SolidusPrintInvoice::VERSION
  spec.authors = ['Solidus Contrib']

  spec.summary = 'Print invoices from a spree order'
  spec.description = \
    'This extension provides a "Print Invoice" button on the ' \
    'Admin Orders view screen which generates a PDF of the order details.'
  spec.email = 'contact@solidus.io'
  spec.homepage = 'https://github.com/jtapia/solidus_print_invoice'
  spec.license = 'BSD-3-Clause'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jtapia/solidus_print_invoice'
  spec.metadata['changelog_uri'] = 'https://github.com/jtapia/solidus_print_invoice/releases'

  spec.required_ruby_version = '>= 3.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  files = Dir.chdir(__dir__) { `git ls-files -z`.split("\x0") }

  spec.files = files.grep_v(%r{^(test|spec|features)/})
  spec.test_files = files.grep(%r{^(test|spec|features)/})
  spec.bindir = 'exe'
  spec.executables = files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'prawn', '1.0.0'
  spec.add_dependency 'solidus_core', ['>= 2.0.0', '< 5']
  spec.add_dependency 'solidus_support', '~> 0.8'

  spec.add_development_dependency 'rails-controller-testing'
  spec.add_development_dependency 'solidus_dev_support', '~> 2.7'
end
