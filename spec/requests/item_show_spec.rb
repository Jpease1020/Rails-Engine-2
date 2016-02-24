require 'rails_helper'

describe "item" do
  describe "GET show" do
    it "returns a specific item" do
      item_1 = create(:item)

      get "/api/v1/items/#{item_1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      item = JSON.parse(response.body)
      assert_equal item['name'], item_1.name
      assert_equal item['merchant_id'], item_1.merchant.id
    end
  end
end
