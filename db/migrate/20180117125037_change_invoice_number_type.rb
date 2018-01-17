class ChangeInvoiceNumberType < ActiveRecord::Migration[5.1]
  def up
    add_column :spree_orders, :invoice_number_tmp, :string

    Spree::Order.reset_column_information
    Spree::Order.all.find_each do |order|
      next if order.invoice_number.blank?
      order.invoice_number_tmp = order.invoice_number
      order.save(touch: false)
    end

    remove_column :spree_orders, :invoice_number
    rename_column :spree_orders, :invoice_number_tmp, :invoice_number
  end

  def down
    add_column :spree_orders, :invoice_number_tmp, :integer

    Spree::Order.reset_column_information
    Spree::Order.all.find_each do |order|
      next if order.invoice_number.blank?
      order.invoice_number_tmp = order.invoice_number.to_i
      order.save(touch: false)
    end

    remove_column :spree_orders, :invoice_number
    rename_column :spree_orders, :invoice_number_tmp, :invoice_number
  end
end
