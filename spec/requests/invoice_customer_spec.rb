require "rails_helper"

describe "invocies" do
  describe "GET /api/v1/invoices/:id/customer" do
    it "returns the associated customer" do

      customer_1 = create(:customer)
      customer_2 = create(:customer)
      invoice_1 = create(:invoice, {customer_id: customer_1.id})
      invoice_2 = create(:invoice, {customer_id: customer_2.id})

      get "/api/v1/invoices/#{invoice_1.id}/customer", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      customer = JSON.parse(response.body)
      assert_equal customer['first_name'], customer_1.first_name

    end
  end
end
