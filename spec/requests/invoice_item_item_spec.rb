require 'rails_helper'

describe "invoice_items item" do
  describe "GET /api/v1/invoice_items/:id/item returns the associated item" do
    it "returns the associated item" do
      item_1 = create(:item, {name: "super duper"})
      item_2 = create(:item)
      invoice_item_1 = create(:invoice_item, {item_id: item_1.id})
      invoice_item_2 = create(:invoice_item, {item_id: item_2.id})

      get "/api/v1/invoice_items/#{invoice_item_1.id}/item", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      item = JSON.parse(response.body)
      assert_equal item['name'], 'super duper'
    end
  end
end
