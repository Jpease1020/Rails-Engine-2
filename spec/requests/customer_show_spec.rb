require 'rails_helper'

describe "customers" do
  describe "GET show" do
    it "returns a specific customer" do
      customer_1 = create(:customer)

      get "/api/v1/customers/#{customer_1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      customer = JSON.parse(response.body)
      assert_equal customer['first_name'], customer_1.first_name
    end
  end
end
