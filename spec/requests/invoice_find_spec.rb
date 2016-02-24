require 'rails_helper'

describe "invoices" do
  describe "find" do
    it "returns a invoice by the params entered into the request" do
      merchant = create(:merchant)
      invoice_1 = create(:invoice, {status: "success", merchant_id: merchant.id})
      invoice_list = create_list(:invoice, 10)
      invoice_params = {
                id: "#{invoice_1.id}"
            }
      get "/api/v1/invoices/find", invoice_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      invoice = JSON.parse(response.body)
      assert_equal invoice['status'], Invoice.find_by(merchant_id: invoice_1.merchant_id).status
    end
  end

  describe "find all" do
    it "returns all invoices by the params entered into the request" do
      merchant_1 = create(:merchant)
      merchant_2 = create(:merchant)
      invoice_list = create_list(:invoice, 10, {merchant_id: merchant_1.id, status: "shipped"})
      statuses = ['completed', 'incompleted', 'uncompleted', 'totally absolutely comepleted'].sample
      invoice_list_2 = create_list(:invoice, 5, {merchant_id: merchant_2.id, status: statuses})
      invoice_params = {
                merchant_id: "#{invoice_list.first.merchant_id}"
            }
      get "/api/v1/invoices/find_all", invoice_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      invoices = JSON.parse(response.body)
      assert_equal 10, invoices.count
      assert_equal invoices.first['status'], Invoice.find_by(merchant_id: invoice_list.first.merchant_id).status
      refute invoices.include?(invoice_list_2.sample.merchant_id)
    end
  end
end
