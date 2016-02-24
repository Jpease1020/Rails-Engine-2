require 'rails_helper'

describe "transactions" do
  describe "find" do
    it "returns a transaction by the params entered into the request" do
      invoice = create(:invoice)
      transaction_1 = create(:transaction, {result: "good", invoice_id: invoice.id})
      transaction_list = create_list(:transaction, 10)
      transaction_params = {
                id: "#{transaction_1.id}"
            }
      get "/api/v1/transactions/find", transaction_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      transaction = JSON.parse(response.body)
      assert_equal transaction['result'], Transaction.find_by(invoice_id: invoice.id).result
    end
  end

  describe "find all" do
    it "returns all transactions by the params entered into the request" do

    results = ["good", "so so", "ehh", "mas o menos"].sample
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)

    transaction_list = create_list(:transaction, 10, {result: "shazam", invoice_id: invoice1.id})
    transaction_list_2 = create_list(:transaction, 5, {result: results, invoice_id: invoice2.id} )

    transaction_params = {
                result: "#{transaction_list.first.result}"
            }
    get "/api/v1/transactions/find_all", transaction_params, { "Accept" => "application/json" }

    expect(response.status).to eq 200
    transactions = JSON.parse(response.body)

    assert_equal 10, transactions.count
    assert_equal transactions.first['result'], Transaction.find_by(invoice_id: transaction_list.first.invoice_id).result
    refute transactions.include?(transaction_list_2.sample)
    end
  end
end

# t.string   "credit_card_number"
# t.string   "result"
# t.datetime "created_at",         null: false
# t.datetime "updated_at",         null: false
# t.integer  "invoice_id"
