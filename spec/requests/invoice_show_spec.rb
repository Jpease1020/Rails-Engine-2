require 'rails_helper'

describe "invoice" do
  describe "GET show" do
    it "returns a specific invoice" do
      invoice_1 = create(:invoice)

      get "/api/v1/invoices/#{invoice_1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      invoice = JSON.parse(response.body)
      assert_equal invoice['status'], invoice_1.status
      assert_equal invoice['customer_id'], invoice_1.customer.id
    end
  end
end
