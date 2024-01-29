# frozen_string_literal: true

module Spree
  module PrintInvoice
  end
end

Rails.application.reloader.to_prepare do
  Spree::PrintInvoice.const_set(:Config, Spree::PrintInvoiceConfiguration.new)
end
