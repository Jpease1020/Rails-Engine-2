require 'rails_helper'

describe "invoice_items" do
  describe "find" do
    it "returns a invoice_item by the params entered into the request" do
      invoice = create(:invoice)
      invoice_item_1 = create(:invoice_item, {quantity: 13, invoice_id: invoice.id})
      invoice_item_list = create_list(:invoice_item, 10)
      invoice_item_params = {
                id: "#{invoice_item_1.id}"
            }
      get "/api/v1/invoice_items/find", invoice_item_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      invoice_item = JSON.parse(response.body)
      assert_equal invoice_item['quantity'], InvoiceItem.find_by(invoice_id: invoice_item_1.invoice_id).quantity
    end
  end

  describe "find all" do
    it "returns all invoice_items by the params entered into the request" do
      item1 = create(:item)
      item2 = create(:item)
      invoice_item_list = create_list(:invoice_item, 10, {item_id: item1.id})
      prices = [34,456456,46456,456456888,34,2342,5,2414,].sample
      invoice_item_list_2 = create_list(:invoice_item, 5, {unit_price: prices, item_id: item2.id})
      invoice_item_params = {
                unit_price: "#{invoice_item_list.first.unit_price}"
            }
      get "/api/v1/invoice_items/find_all", invoice_item_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      invoice_items = JSON.parse(response.body)
      assert_equal 10, invoice_items.count
      assert_equal invoice_items.first['item_id'], InvoiceItem.find_by(item_id: invoice_item_list.first.item_id).item_id
      refute invoice_items.include?(invoice_item_list_2.sample)
    end
  end
end
