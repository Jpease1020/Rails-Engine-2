class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items
  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
end
