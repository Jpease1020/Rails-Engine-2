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

  def self.revenue(id)
    { "revenue"=> joins(invoices: [:invoice_items, :transactions])
                  .where('transactions.result = ? AND merchants.id = ?', "success", id)
                  .sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.revenue_by_date(id, date)
    {"revenue"=> joins(invoices: [:invoice_items, :transactions])
                  .where('invoices.updated_at = ? AND transactions.result = ?', date, "success")
                  .sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.pending_invoices_customers(id)
    select("customers.*")
      .joins(invoices: [:customer, :transactions])
      .where('merchants.id = ?', id)
      .where.not('transactions.result = ?', "success").uniq
  end

  def self.all_merchant_revenue(date)
    { "total_revenue" => joins(invoices: [:invoice_items, :transactions])
                          .where('invoices.updated_at = ? AND transactions.result = ?', date, "success")
                          .sum("invoice_items.quantity * invoice_items.unit_price")}
  end

  def self.favorite_customer(id)
            # first try
    # hash = select("customers.*").joins(invoices: [:customer, :transactions]).group('customer_id').where('transactions.result = ? AND merchants.id = ?', "success", id).count
    # max_value = select("customers.*").joins(invoices: [:customer, :transactions]).group('customer_id').where('transactions.result = ? AND merchants.id = ?', "success", id).count.values.max
    # cus_id = hash.key(max_value)
    # Customer.find(cus_id)

            # looking at the answer
    # Customer.joins(invoices: :transactions)
    #             .where("invoices.merchant_id = ? AND transactions.result = 'success'", id)
    #             .group('id')
    #             .order('count(invoices.customer_id) DESC')
    #             .first


              # refactored
    select("customers.*")
      .joins(invoices: [:customer, :transactions])
      .where('transactions.result = ? AND merchants.id = ?', "success", id)
      .group('customers.id')
      .order('count(invoices.customer_id) DESC')
      .first
  end
end
