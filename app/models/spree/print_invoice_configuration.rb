# frozen_string_literal: true

module Spree
  class PrintInvoiceConfiguration < Preferences::Configuration
    preference :print_invoice_next_number, :integer, default: nil

    # To avoid breaking stores with custom logos on their invoices and to
    # provide a fully functioning OOTB experience, this preference uses the
    # old Solidus PNG logo if no custom configuration is provided OR a
    # custom logo if it is not SVG.
    # @return [String] Path to the logo
    preference :print_invoice_logo_path, :string,
               default: if Spree::Config[:admin_interface_logo].end_with?('.svg')
                          'logo/solidus_logo.png'
                        else
                          Spree::Config[:admin_interface_logo]
                        end

    preference :print_invoice_logo_scale, :integer, default: 50
    preference :print_invoice_font_face, :string, default: 'Helvetica'
    preference :print_buttons, :string, default: 'invoice'
    preference :prawn_options, :hash, default: {}

    def use_sequential_number?
      print_invoice_next_number.present? && print_invoice_next_number > 0
    end

    def increase_invoice_number
      current_invoice_number = print_invoice_next_number
      set_preference(:print_invoice_next_number, current_invoice_number + 1)
      current_invoice_number
    end
  end
end
