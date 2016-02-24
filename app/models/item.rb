class Item < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.most_revenue(count)
    Item.select("items.*, count('invoice_item.unit_price * invoice_item.quantity') AS item_revenue").joins(invoice_items: [invoice: :transactions]).group("items.id").where("transactions.result = ?", "success").order("item_revenue DESC").take(count)
  end
end
