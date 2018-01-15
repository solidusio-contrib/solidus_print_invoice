class AddInvoiceNumberToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_stores, :print_invoice_next_number, :integer
  end
end
