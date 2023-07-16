# frozen_string_literal: true

module SolidusPrintInvoice
  module Spree
    module Admin
      module OrdersControllerDecorator
        def self.prepended(base)
          base.class_eval do
            respond_to :pdf
            helper ::Spree::Admin::PrintInvoiceHelper
          end
        end

        def show
          load_order
          respond_with(@order) do |format|
            format.pdf do
              template = params[:template] || "invoice"
              if (template == "invoice") &&
                 ::Spree::PrintInvoice::Config.use_sequential_number? &&
                 @order.invoice_number.blank?
                @order.invoice_number = ::Spree::PrintInvoice::Config.increase_invoice_number
                @order.invoice_date = Time.zone.today
                @order.save!
              end
              render layout: false, template: "spree/admin/orders/#{template}", formats: [:pdf], handlers: [:prawn]
            end
          end
        end

        ::Spree::Admin::OrdersController.prepend self
      end
    end
  end
end
