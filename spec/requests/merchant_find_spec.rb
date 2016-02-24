require 'rails_helper'

describe "merchants" do
  describe "find" do
    it "returns a merchant by the params entered into the request" do
      merchant_1 = create(:merchant, {name: "A store"})
      merchant_list = create_list(:merchant, 10)
      merchant_params = {
                id: "#{merchant_1.id}"
            }
      get "/api/v1/merchants/find", merchant_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      merchant = JSON.parse(response.body)
      assert_equal merchant['name'], Merchant.find_by(name: merchant_1.name).name
    end
  end

  describe "find all" do
    it "returns all merchants by the params entered into the request" do

    merchant_list = create_list(:merchant, 10, {name: "shazam"})
    merchant_list_2 = create_list(:merchant, 5, {name: "heyya"} )

    merchant_params = {
                name: "#{merchant_list.first.name}"
            }
    get "/api/v1/merchants/find_all", merchant_params, { "Accept" => "application/json" }

    expect(response.status).to eq 200
    merchants = JSON.parse(response.body)

    assert_equal 10, merchants.count
    assert_equal merchants.first['name'], Merchant.find_by(id: merchant_list.first.id).name
    refute merchants.include?(merchant_list_2.sample)
    end
  end
end
