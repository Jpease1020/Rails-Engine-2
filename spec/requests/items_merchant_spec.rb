require "rails_helper"

describe "item merchant" do
  describe "GET /api/v1/items/:id/merchant" do
    it "returns the associated merchant" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      item_1 = create(:item, {merchant_id: merchant_1.id})
      item_2 = create(:item, {merchant_id: merchant_2.id})

      get "/api/v1/items/#{item_1.id}/merchant", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      merchant = JSON.parse(response.body)
      assert_equal merchant['name'], merchant_1.name
    end
  end
end
