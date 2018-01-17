module Spree
  module Orders
    module InvoiceNumberGenerator
      class Default
        def initialize(order)
          @order = order
        end

        def generate
          Spree::PrintInvoice::Config.prefix + Spree::PrintInvoice::Config.increase_invoice_number
        end
      end
    end
  end
end
