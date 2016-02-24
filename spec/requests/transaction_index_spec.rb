require 'rails_helper'

describe "transactions" do
  describe "GET index" do
    it "returns all transactions" do
      transaction_list = create_list(:transaction, 5)

      get "/api/v1/transactions", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      transactions = JSON.parse(response.body)
      assert_equal transactions.last['result'], transaction_list.last.result
      assert_equal transactions.last['invoice_id'], transaction_list.last.invoice.id
      assert_equal transactions.count, Transaction.count
    end
  end
end
