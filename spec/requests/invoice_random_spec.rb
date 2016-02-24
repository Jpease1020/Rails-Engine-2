require 'rails_helper'

describe "invoices" do
  describe "GET random" do
    it "returns a random invoice" do
      20.times do |n|
        Invoice.create(id: n )
      end

      get "/api/v1/invoices/random", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

    end
  end
end
