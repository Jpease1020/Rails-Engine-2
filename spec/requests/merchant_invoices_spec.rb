require 'rails_helper'

describe "merchants" do
  describe "GET /api/v1/merchants/:id/invoices" do
    it "returns all invoices for a specific merchant" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      invoices_1 = create_list(:invoice, 7, {status: "good", merchant_id: merchant_1.id})
      invoices_2 = create_list(:invoice, 3, {status: "not so good", merchant_id: merchant_2.id})

      get "/api/v1/merchants/#{merchant_1.id}/invoices", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      invoices = JSON.parse(response.body)

      assert_equal 7, invoices.count
      assert_equal invoices.first['status'], invoices_1.first.status
      refute invoices.include?(invoices_2.sample)
    end
  end
end
