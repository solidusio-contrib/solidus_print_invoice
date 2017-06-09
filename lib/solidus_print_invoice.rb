require 'solidus_core'
require 'solidus_support'
require 'solidus_print_invoice/engine'
require 'prawn_handler'

module Spree
  module PrintInvoice
    def self.config(&block)
      yield(Spree::PrintInvoice::Config)
    end
  end
end
