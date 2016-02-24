require 'rails_helper'

describe "invoice" do
  describe "GET index" do
    it "returns all invoices" do
      invoice_list = create_list(:invoice, 5)

      get "/api/v1/invoices", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      invoices = JSON.parse(response.body)
      assert_equal invoices.last['status'], invoice_list.last.status
      assert_equal invoices.last['customer_id'], invoice_list.last.customer.id
      assert_equal invoices.count, Invoice.count
    end
  end
end
