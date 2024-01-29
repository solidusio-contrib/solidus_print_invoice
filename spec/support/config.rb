# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    Spree::PrintInvoice::Config.reset
  end
end
