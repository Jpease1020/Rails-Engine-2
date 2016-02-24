require 'rails_helper'

describe "customers" do
  describe "GET /api/v1/customers/:id/invoices" do
    it "returns a collection of associated invoices" do
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      invoices_1 = create_list(:invoice, 7, {status: "good", customer_id: customer_1.id})
      invoices_2 = create_list(:invoice, 3, {status: "not so good", customer_id: customer_2.id})

      get "/api/v1/customers/#{customer_1.id}/invoices", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      invoices = JSON.parse(response.body)

      assert_equal 7, invoices.count
      assert_equal invoices.first['status'], "good"
      refute invoices.include?(invoices_2.sample)
    end
  end
end
