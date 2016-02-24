require 'rails_helper'

describe "transactions" do
  describe "GET random" do
    it "returns a random transaction" do
      20.times do |n|
        Transaction.create(id: n)
      end

      get "/api/v1/transactions/random", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

    end
  end
end
