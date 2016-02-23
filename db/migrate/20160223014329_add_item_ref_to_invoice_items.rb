class AddItemRefToInvoiceItems < ActiveRecord::Migration
  def change
    add_reference :invoice_items, :item, index: true, foreign_key: true
  end
end
