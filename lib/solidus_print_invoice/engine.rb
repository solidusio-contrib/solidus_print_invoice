# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

module SolidusPrintInvoice
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_print_invoice'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'spree.print_invoice.mimetypes' do |_app|
      unless Mime::Type.lookup_by_extension(:pdf)
        Mime::Type.register('application/pdf', :pdf)
      end
    end
  end
end
