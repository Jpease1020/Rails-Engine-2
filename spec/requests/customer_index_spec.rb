require 'rails_helper'

describe "customers" do
  describe "GET index" do
    it "returns all customers" do
      customer_list = create_list(:customer, 5)

      get "/api/v1/customers", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      customers = JSON.parse(response.body)
      assert_equal customers.last['first_name'], customer_list.last.first_name
      assert_equal customers.last['last_name'], customer_list.last.last_name
      assert_equal customers.count, Customer.count
    end
  end
end
