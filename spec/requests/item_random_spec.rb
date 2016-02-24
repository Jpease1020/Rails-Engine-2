require 'rails_helper'

describe "items" do
  describe "GET random" do
    it "returns a random item" do
      20.times do |n|
        Item.create(id: n)
      end

      get "/api/v1/items/random", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

    end
  end
end
