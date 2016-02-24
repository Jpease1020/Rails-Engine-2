require 'rails_helper'

describe "invoice_items invoice" do
  describe "GET /api/v1/invoice_items/:id/invoice" do
    it "returns the associated invoice" do
      invoice_1 = create(:invoice, {status: "super duper"})
      invoice_2 = create(:invoice)
      invoice_item_1 = create(:invoice_item, {invoice_id: invoice_1.id})
      invoice_item_2 = create(:invoice_item, {invoice_id: invoice_2.id})

      get "/api/v1/invoice_items/#{invoice_item_1.id}/invoice", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      invoice = JSON.parse(response.body)
      assert_equal invoice['status'], 'super duper'
    end
  end
end
