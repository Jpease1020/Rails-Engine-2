require 'rails_helper'

describe "invoice items" do
  describe "GET random" do
    it "returns a random invoice item" do
      20.times do |n|
        InvoiceItem.create(id: n)
      end

      get "/api/v1/invoice_items/random", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

    end
  end
end
