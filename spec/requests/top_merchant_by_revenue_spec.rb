require 'rails_helper'

describe "item" do
  describe "GET /api/v1/merchants/most_revenue?quantity=x" do
    it "returns the top x merchants ranked by total revenue" do
      item_list_1            = create_list(:item, 7)
      merchant_1             = create(:merchant)
      merchant_2             = create(:merchant)
      merchant_3             = create(:merchant)
      invoice_1              = create(:invoice, merchant_id: merchant_1.id)
      invoice_2              = create(:invoice, merchant_id: merchant_2.id)
      invoice_3              = create(:invoice, merchant_id: merchant_3.id)
      transaction_1     = create(:transaction, invoice_id: invoice_1.id, result: "success")
      transaction_2     = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_3     = create(:transaction, invoice_id: invoice_3.id, result: "success")
      invoice_items_1   = create_list(:invoice_item, 15, item_id: item_list_1.first.id, invoice_id: invoice_1.id)
      invoice_items_2   = create_list(:invoice_item, 3, item_id: item_list_1.third.id, invoice_id: invoice_2.id)
      invoice_items_3   = create_list(:invoice_item, 3, item_id: item_list_1.second.id, invoice_id: invoice_3.id)

      get "/api/v1/merchants/most_revenue?quantity=3", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      merchants = JSON.parse(response.body)
      assert_equal 3, merchants.count
      assert merchants.first['total_revenue'].to_i >= merchants.second['total_revenue'].to_i
      assert merchants.second['total_revenue'].to_i >= merchants.third['total_revenue'].to_i
    end
  end
end
