class ChangeQuantityToInvoiceItems < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :quantity, :string
    add_column :invoice_items, :quantity, :integer
  end
end
