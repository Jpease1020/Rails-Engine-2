require 'rails_helper'

describe "customers" do
  describe "GET /api/v1/customers/:id/transactions" do
    it "returns a collection of associated transactions" do
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      invoice_1 = create(:invoice, {customer_id: customer_1.id})
      invoice_2 = create(:invoice, {customer_id: customer_2.id})
      transactions_1 = create_list(:transaction, 7, {result: "good", invoice_id: invoice_1.id})
      transactions_2 = create_list(:transaction, 3, {result: "not so good", invoice_id: invoice_2.id})

      get "/api/v1/customers/#{customer_1.id}/transactions", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      transactions = JSON.parse(response.body)

      assert_equal 7, transactions.count
      assert_equal transactions.first['result'], transactions_1.first.result
      refute transactions.include?(transactions_2.sample)
    end
  end
end
