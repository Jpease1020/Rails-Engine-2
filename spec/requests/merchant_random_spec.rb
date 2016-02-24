require 'rails_helper'

describe "merchant" do
  describe "GET random" do
    it "returns a random merchant" do
      20.times do |n|
        Merchant.create(id: n)
      end

      get "/api/v1/merchants/random", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

    end
  end
end
