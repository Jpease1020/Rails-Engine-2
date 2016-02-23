class Merchant < ActiveRecord::Base
  scope :ci_find, lambda { |attribute, value| where("lower(#{attribute}) = ?", value.downcase).first }
end
