require 'rails_helper'

describe "item" do
  describe "GET /api/v1/items/most_revenue?quantity=x" do
    it "returns the top x items ranked by total revenue generated" do
      item_list_1            = create_list(:item, 7)
      item_list_2            = create_list(:item, 5)
      invoice_1         = create(:invoice)
      transaction_1     = create(:transaction, invoice_id: invoice_1.id, result: "success")
      invoice_items_1   = create_list(:invoice_item, 5, item_id: item_list_1.first.id, invoice_id: invoice_1.id)
      invoice_items_2   = create_list(:invoice_item, 3, item_id: item_list_2.first.id, invoice_id: invoice_1.id)
      invoice_items_3   = create_list(:invoice_item, 3, item_id: item_list_1.second.id, invoice_id: invoice_1.id)

      get "/api/v1/items/most_revenue?quantity=3", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      items = JSON.parse(response.body)

      assert_equal 3, items.count
      assert_equal items.last['id'], 103
      assert items.first['item_revenue'] >= items.second['item_revenue']
      assert items.second['item_revenue'] >= items.third['item_revenue']
    end
  end
end
