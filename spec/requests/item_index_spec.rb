require 'rails_helper'

describe "item" do
  describe "GET index" do
    it "returns all items" do
      items_list = create_list(:item, 5)

      get "/api/v1/items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      items = JSON.parse(response.body)
      assert_equal items.last['name'], items_list.last.name
      assert_equal items.last['merchant_id'], items_list.last.merchant.id
      assert_equal items.count, Item.count
    end
  end
end
