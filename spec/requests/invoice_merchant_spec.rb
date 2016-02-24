require "rails_helper"

describe "invoice merchant" do
  describe "GET /api/v1/invoices/:id/merchant" do
    it "returns the associated merchant" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      invoice_1 = create(:invoice, {merchant_id: merchant_1.id})
      invoice_2 = create(:invoice, {merchant_id: merchant_2.id})

      get "/api/v1/invoices/#{invoice_1.id}/merchant", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      merchant = JSON.parse(response.body)
      assert_equal merchant['name'], merchant_1.name
    end
  end
end
