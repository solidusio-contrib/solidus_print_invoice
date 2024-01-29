# frozen_string_literal: true

require 'solidus_print_invoice/version'
require 'solidus_print_invoice/engine'

require 'action_view/template/handlers/prawn'

module Spree
  module PrintInvoice
    # Support the legacy location for the constant
    VERSION = SolidusPrintInvoice::VERSION

    def self.config
      yield(Spree::PrintInvoice::Config)
    end
  end
end
