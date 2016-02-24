require 'rails_helper'

describe "invoices" do
  describe "GET /api/v1/invoices/:id/invoice_items" do
    it "returns all invoice_items for a specific invoice" do
      invoice_1 = create(:invoice)
      invoice_2 = create(:invoice)

      invoice_items_1 = create_list(:invoice_item, 7, {quantity: 2, invoice_id: invoice_1.id})
      invoice_items_2 = create_list(:invoice_item, 3, {quantity: 7, invoice_id: invoice_2.id})

      get "/api/v1/invoices/#{invoice_1.id}/invoice_items", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      invoice_items = JSON.parse(response.body)

      assert_equal 7, invoice_items.count
      assert_equal invoice_items.first['quantity'], invoice_items_1.first.quantity
      refute invoice_items.include?(invoice_items_2.sample)
    end
  end
end
