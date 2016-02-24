require 'rails_helper'

describe "invoice_item" do
  describe "GET show" do
    it "returns a specific invoice_item" do
      invoice_item_1 = create(:invoice_item, { unit_price: 34.90})

      get "/api/v1/invoice_items/#{invoice_item_1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      invoice_item = JSON.parse(response.body)
      assert_equal invoice_item['quantity'], invoice_item_1.quantity
      assert_equal invoice_item['item_id'], invoice_item_1.item.id
    end
  end
end
