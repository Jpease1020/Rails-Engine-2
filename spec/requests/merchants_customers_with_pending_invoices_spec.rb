require 'rails_helper'

describe "revenue" do
  describe "GET /api/v1/merchants/:id/customers_with_pending_invoices" do
    it "returns a collection of customers which have pending (unpaid) invoices" do
      merchant_1             = create(:merchant)
      customer_1             = create(:customer)
      customer_2             = create(:customer)
      customer_3             = create(:customer)
      customer_4             = create(:customer)
      customer_5             = create(:customer, {first_name: "Chilly willy"})
      invoice_1              = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_1.id, status: "success")
      invoice_2              = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_2.id, status: "success")
      invoice_3              = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_3.id, status: "pending")
      invoice_4              = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_4.id, status: "pending")
      invoice_5              = create(:invoice, merchant_id: merchant_1.id, customer_id: customer_5.id, status: "pending")
      transaction_1     = create(:transaction, invoice_id: invoice_1.id, result: "success")
      transaction_2     = create(:transaction, invoice_id: invoice_2.id, result: "success")
      transaction_3     = create(:transaction, invoice_id: invoice_3.id, result: "failed")
      transaction_3     = create(:transaction, invoice_id: invoice_4.id, result: "failed")
      transaction_3     = create(:transaction, invoice_id: invoice_5.id, result: "failed")

      get "/api/v1/merchants/#{merchant_1.id}/customers_with_pending_invoices", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      customers = JSON.parse(response.body)

      assert_equal 3, customers.count
    end
  end
end
