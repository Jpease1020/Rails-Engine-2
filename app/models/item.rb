class Item < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  def self.most_revenue(count)
    select("items.*, sum(invoice_items.unit_price * invoice_items.quantity) AS item_revenue")
        .joins(invoice_items: [invoice: :transactions])
        .group("items.id")
        .where("transactions.result = ?", "success")
        .order("item_revenue DESC")
        .take(count)
  end

  def self.most_items(count)
    select("items.*, count(invoice_items.quantity) AS item_count")
        .joins(invoice_items: [invoice: :transactions])
        .group("items.id")
        .where("transactions.result = ?", "success")
        .order("item_count DESC")
        .take(count)
  end
end
