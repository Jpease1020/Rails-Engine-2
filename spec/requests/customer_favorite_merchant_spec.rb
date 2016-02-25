require 'rails_helper'

describe "customers" do
  describe "GET /api/v1/customers/:id/favorite_merchant" do
    it "returns a merchant where the customer has conducted the most successful transactions" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      invoice_1 = create(:invoice, {customer_id: customer_1.id, merchant_id: merchant_1.id})
      invoice_2 = create(:invoice, {customer_id: customer_2.id, merchant_id: merchant_2.id})
      transaction_1 = create(:transaction, {result: "success", invoice_id: invoice_1.id})
      transaction_2 = create(:transaction, {result: "not so good", invoice_id: invoice_2.id})

      get "/api/v1/customers/#{customer_1.id}/favorite_merchant", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      merchant = JSON.parse(response.body)

      assert_equal merchant['name'], merchant_1.name
    end
  end
end
