require 'rails_helper'

describe "invoice items" do
  describe "GET index" do
    it "returns all invoice items" do
      invoice_item_list = create_list(:invoice_item, 5)

      get "/api/v1/invoice_items", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      invoices = JSON.parse(response.body)
      assert_equal invoices.last['quantity'], invoice_item_list.last.quantity
      assert_equal invoices.last['item_id'], invoice_item_list.last.item.id
      assert_equal invoices.count, InvoiceItem.count
    end
  end
end
