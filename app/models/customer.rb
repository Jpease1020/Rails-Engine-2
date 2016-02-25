class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.favorite_merchant(id)
    select("merchants.*").joins(invoices: [:merchant, :transactions]).where('transactions.result = ? AND customers.id = ?', "success", id).group('merchants.id').order('count(invoices.merchant_id) DESC').first
  end
end
