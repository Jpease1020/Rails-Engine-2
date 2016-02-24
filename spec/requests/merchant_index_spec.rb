# spec/requests/movies_spec.rb
require 'rails_helper'

describe "merchants" do
  describe "GET index" do
    it "returns all merchants" do
      merchant_list = create_list(:merchant, 5)

      get "/api/v1/merchants", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      merchants = JSON.parse(response.body)
      assert_equal merchants.last['name'], merchant_list.last.name
      assert_equal merchants.count, Merchant.count
    end
  end
end
