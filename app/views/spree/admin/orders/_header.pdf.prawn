fill_color Spree::PrintInvoice::Config[:print_invoice_header_color]
if @hide_prices
  text I18n.t('spree.packaging_slip'), :align => :right, :style => :bold, :size => 18
else
  text I18n.t('spree.customer_invoice'), :align => :right, :style => :bold, :size => 18
end
fill_color "000000"

