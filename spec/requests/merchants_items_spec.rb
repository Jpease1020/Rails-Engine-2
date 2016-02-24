require 'rails_helper'

describe "merchants" do
  describe "GET /api/v1/merchants/:id/items" do
    it "returns all items for a specific merchant" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      items_1 = create_list(:item, 7, {name: "hi", merchant_id: merchant_1.id})
      items_2 = create_list(:item, 3, {name: "ja", merchant_id: merchant_2.id})

      get "/api/v1/merchants/#{merchant_1.id}/items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      items = JSON.parse(response.body)
      assert_equal 7, items.count
      assert_equal items.first['name'], items_1.first.name
      refute items.include?(items_2.sample)
    end
  end
end
