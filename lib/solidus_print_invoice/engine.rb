# frozen_string_literal: true

require 'spree/core'
require 'deface'

module SolidusPrintInvoice
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_print_invoice'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree.print_invoice.environment", before: :load_config_initializers do |_app|
      Spree::PrintInvoice::Config = Spree::PrintInvoiceConfiguration.new
    end

    initializer "spree.print_invoice.mimetypes" do |_app|
      Mime::Type.register('application/pdf', :pdf) unless Mime::Type.lookup_by_extension(:pdf)
    end
  end
end
