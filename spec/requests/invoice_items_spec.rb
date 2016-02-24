require 'rails_helper'

describe "invoices" do
  describe "GET /api/v1/invoices/:id/items" do
    it "returns all items for a specific invoice" do

      items_1 = create_list(:item, 7, {name: "item 1"})
      items_2 = create_list(:item, 3, {name: "item 2"})

      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)

      invoice_items_1 = create_list(:invoice_item, 7, {quantity: 2, invoice_id: invoice_1.id, item_id: items_1.sample.id})
      invoice_items_2 = create_list(:invoice_item, 3, {quantity: 7, invoice_id: invoice_2.id, item_id: items_2.sample.id})

      get "/api/v1/invoices/#{invoice_1.id}/items", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      items = JSON.parse(response.body)

      assert_equal 7, items.count
      assert_equal items.first['name'], items_1.first.name
      refute items.include?(items_2.sample)
    end
  end
end
