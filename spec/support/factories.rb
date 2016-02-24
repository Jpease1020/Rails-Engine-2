FactoryGirl.define do

  factory :customer do
    first_name "John"
    last_name  "Doe"
    created_at Date.today
    updated_at Date.today
  end

  factory :merchant do
    name "Home Depot"
    created_at Date.today
    updated_at Date.today
  end

  factory :item do
    name "item_name"
    description "item_description"
    unit_price 34.54
    created_at Date.today
    updated_at Date.today
    merchant
  end

  factory :invoice do
    created_at Date.today
    updated_at Date.today
    status :shipped
    customer
    merchant
  end

  factory :invoice_item do
    quantity 5
    unit_price 34.56
    created_at Date.today
    updated_at Date.today
    item
    invoice
  end

  factory :transaction do
    credit_card_number 4785909878909876
    created_at Date.today
    updated_at Date.today
    result "success"
    invoice
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
