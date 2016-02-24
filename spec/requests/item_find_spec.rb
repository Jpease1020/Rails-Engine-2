require 'rails_helper'

describe "items" do
  describe "find" do
    it "returns a item by the params entered into the request" do
      merchant = create(:merchant)
      item_1 = create(:item, {name: "an item", merchant_id: merchant.id})
      item_list = create_list(:item, 10)
      item_params = {
                id: "#{item_1.id}"
            }
      get "/api/v1/items/find", item_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      item = JSON.parse(response.body)
      assert_equal item['name'], Item.find_by(merchant_id: item_1.merchant_id).name
    end
  end

  describe "find all" do
    it "returns all items by the params entered into the request" do

    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    descritptions = ["a", "b", "c", "d"].sample

    item_list = create_list(:item, 10, {merchant_id: merchant1.id})
    item_list_2 = create_list(:item, 5, {unit_price: descritptions, merchant_id: merchant2.id})

    item_params = {
                merchant_id: "#{item_list.first.merchant_id}"
            }
    get "/api/v1/items/find_all", item_params, { "Accept" => "application/json" }

    expect(response.status).to eq 200
    items = JSON.parse(response.body)

    assert_equal 10, items.count
    assert_equal items.first['description'], Item.find_by(merchant_id: item_list.first.merchant_id).description
    refute items.include?(item_list_2.sample)
    end
  end
end
