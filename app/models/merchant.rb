class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def self.most_revenue(quantity)
    select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
          .joins(invoices: [:transactions, :invoice_items])
          .group("merchants.id")
          .where("transactions.result = ?", "success")
          .order("total_revenue DESC")
          .take(quantity)
  end

  def self.most_items(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS total_sold")
          .joins(invoices: [:invoice_items, :transactions])
          .group('merchants.id')
          .where("transactions.result = ?", "success")
          .order("total_sold DESC")
          .take(quantity)
  end

  def self.revenue(date)
    { "total_revenue" => joins(invoices: [:invoice_items, :transactions])
                          .where('invoices.updated_at = ? AND transactions.result = ?', date, "success")
                          .sum("invoice_items.quantity * invoice_items.unit_price")}
  end
end
