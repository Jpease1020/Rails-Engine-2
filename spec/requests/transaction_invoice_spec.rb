require 'rails_helper'

describe "transactions invoice" do
  describe "GET /api/v1/transactions/:id/invoice" do
    it "returns the associated invoice" do
      invoice_1 = create(:invoice, {status: "super duper"})
      invoice_2 = create(:invoice)
      transaction_1 = create(:transaction, {invoice_id: invoice_1.id})
      transaction_2 = create(:transaction, {invoice_id: invoice_2.id})

      get "/api/v1/transactions/#{transaction_1.id}/invoice", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      invoice = JSON.parse(response.body)
      assert_equal invoice['status'], 'super duper'
    end
  end
end
