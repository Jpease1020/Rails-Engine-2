require 'rails_helper'

describe "items" do
  describe "GET /api/v1/items/:id/invoice_items" do
    it "returns a collection of associated invoice items" do
      item_1 = create(:item)
      item_2 = create(:item)

      invoice_items_1 = create_list(:invoice_item, 7, {quantity: 2, item_id: item_1.id})
      invoice_items_2 = create_list(:invoice_item, 3, {quantity: 7, item_id: item_2.id})

      get "/api/v1/items/#{item_1.id}/invoice_items", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      invoice_items = JSON.parse(response.body)

      assert_equal 7, invoice_items.count
      assert_equal invoice_items.first['quantity'], invoice_items_1.first.quantity
      refute invoice_items.include?(invoice_items_2.sample)
    end
  end
end
