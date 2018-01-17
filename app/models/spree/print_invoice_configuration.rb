module Spree
  class PrintInvoiceConfiguration < Preferences::Configuration
    preference :print_invoice_next_number, :integer, :default => nil
    preference :print_invoice_logo_path, :string, :default => Spree::Config[:admin_interface_logo]
    preference :print_invoice_logo_scale, :integer, :default => 50
    preference :print_invoice_font_face, :string, :default => 'Helvetica'
    preference :print_buttons, :string, :default => 'invoice'
    preference :prawn_options, :hash, :default => {}
    preference :prefix, :string, :default => ''

    class_name_attribute :current_invoice_number_generator_class, :default => 'Spree::Orders::InvoiceNumberGenerator::Default'

    def use_sequential_number?(store = nil)
      store.present? && store.print_invoice_next_number.present? && store.print_invoice_next_number > 0 ||
        print_invoice_next_number.present? && print_invoice_next_number > 0
    end

    def increase_invoice_number(store = nil)
      if store.present? && store.print_invoice_next_number.present?
        current_invoice_number = store.print_invoice_next_number
        store.update print_invoice_next_number: current_invoice_number + 1
      else
        current_invoice_number = print_invoice_next_number
        set_preference(:print_invoice_next_number, current_invoice_number + 1)
      end
      current_invoice_number
    end
  end
end
