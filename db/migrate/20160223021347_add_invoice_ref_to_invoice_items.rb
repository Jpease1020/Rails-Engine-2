class AddInvoiceRefToInvoiceItems < ActiveRecord::Migration
  def change
    add_reference :invoice_items, :invoice, index: true, foreign_key: true
  end
end
