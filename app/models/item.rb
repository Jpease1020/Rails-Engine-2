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

  def self.best_day(id)
    # best_day returns the date with the most sales for the given item using the invoice date
    # select('invoice.updated_at, sum(invoice_items.quantity) AS amount_sold').joins(invoice_items: [invoice: :transactions]).group('invoices.updated_at').where("transactions.result = ?", "success")
    select("invoices.updated_at")
      .joins(invoice_items: [invoice: :transactions])
      .where('transactions.result = ? AND items.id = ?', "success", id)
      .group('invoices.updated_at')
      .order('count(invoice_items.item_id) DESC')
      .first
  end
end

# select("invoices.updated_at").joins(invoice_items: [invoice: :transactions]).where('transactions.result = ? AND merchants.id = ?', "success", id).group('invoice_items.updated_at').order('count(invoices_items.item_id) DESC').first


# select("customers.*")
#   .joins(invoices: [:customer, :transactions])
#   .where('transactions.result = ? AND merchants.id = ?', "success", id)
#   .group('customers.id')
#   .order('count(invoices.customer_id) DESC')
#   .first
