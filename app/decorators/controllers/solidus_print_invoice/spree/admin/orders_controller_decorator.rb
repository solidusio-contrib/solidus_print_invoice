# frozen_string_literal: true

module SolidusPrintInvoice
  module Spree
    module Admin
      module OrdersControllerDecorator
        def self.prepended(base)
          base.class_eval do
            respond_to :pdf
            helper ::Spree::Admin::PrintInvoiceHelper

            before_action :load_order,
                          only: [
                            :edit,
                            :complete,
                            :advance,
                            :cancel,
                            :resume,
                            :approve,
                            :resend,
                            :unfinalize_adjustments,
                            :finalize_adjustments,
                            :cart,
                            :confirm,
                            :show
                          ]
            before_action :load_template, only: :show
          end
        end

        def show
          respond_with(@order) do |format|
            format.pdf do
              if (@template == 'invoice') &&
                ::Spree::PrintInvoice::Config.use_sequential_number? &&
                @order.invoice_number.blank?
                @order.invoice_number = ::Spree::PrintInvoice::Config.increase_invoice_number
                @order.invoice_date = Time.zone.today
                @order.save!
              end

              render layout: false,
                     template: "spree/admin/orders/#{@template}",
                     formats: [:pdf],
                     handlers: [:prawn]
            end

            format.html do
              redirect_to action: :edit
            end
          end
        end

        private

        def load_template
          @template ||= params[:template] || 'invoice'
        end

        ::Spree::Admin::OrdersController.prepend(self)
      end
    end
  end
end
