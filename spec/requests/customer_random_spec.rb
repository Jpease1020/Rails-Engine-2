require 'rails_helper'

describe "customers" do
  describe "GET random" do
    it "returns a random customer" do
      20.times do |n|
        Customer.create(id: n)
      end

      get "/api/v1/customers/random", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

    end
  end
end
