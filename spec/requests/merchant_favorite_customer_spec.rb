require 'rails_helper'

describe "revenue" do
  describe "GET /api/v1/merchants/:id/favorite_customer" do
    it "returns the customer who has conducted the most successful transactions" do
      item_list_1            = create_list(:item, 7)
      merchant_1             = create(:merchant)
      merchant_2             = create(:merchant)
      merchant_3             = create(:merchant)
      customer_1             = create(:customer, {first_name: "Chilly willy"})
      customer_2             = create(:customer)
      invoice_1              = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_1.id)
      invoice_2              = create(:invoice, merchant_id: merchant_2.id, customer_id: customer_1.id)
      invoice_3              = create(:invoice, merchant_id: merchant_3.id, customer_id: customer_2.id)
      transaction_1     = create(:transaction, invoice_id: invoice_1.id, result: "success")
      transaction_2     = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_3     = create(:transaction, invoice_id: invoice_3.id, result: "failed")
      invoice_items_1   = create_list(:invoice_item, 15, item_id: item_list_1.first.id, invoice_id: invoice_1.id)
      invoice_items_2   = create_list(:invoice_item, 3, item_id: item_list_1.third.id, invoice_id: invoice_2.id)
      invoice_items_3   = create_list(:invoice_item, 3, item_id: item_list_1.second.id, invoice_id: invoice_3.id)

      get "/api/v1/merchants/#{merchant_1.id}/favorite_customer", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      customer = JSON.parse(response.body)

      assert_equal "Chilly willy", customer['first_name']
    end
  end
end
