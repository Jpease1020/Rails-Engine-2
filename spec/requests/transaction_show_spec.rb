require 'rails_helper'

describe "transaction" do
  describe "GET show" do
    it "returns a specific transaction" do
      transaction_1 = create(:transaction)

      get "/api/v1/transactions/#{transaction_1.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      transaction = JSON.parse(response.body)
      assert_equal transaction['result'], transaction_1.result
      assert_equal transaction['invoice_id'], transaction_1.invoice.id
    end
  end
end
