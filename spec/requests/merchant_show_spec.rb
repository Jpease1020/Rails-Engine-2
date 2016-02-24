require 'rails_helper'

describe "merchants" do
  describe "GET show" do
    it "returns a specific merchant" do
      merchant = create(:merchant)

      get "/api/v1/merchants/#{merchant.id}", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      merch = JSON.parse(response.body)
      assert_equal merch['name'], merchant.name
    end
  end
end
