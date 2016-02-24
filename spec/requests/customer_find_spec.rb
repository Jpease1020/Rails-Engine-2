require 'rails_helper'

describe "customers" do
  describe "find" do
    it "returns a customer by the params entered into the request" do
      customer_1 = create(:customer, {first_name: "Jeffy"})
      customer_list = create_list(:customer, 10)
      customer_params = {
                id: "#{customer_1.id}"
            }
      get "/api/v1/customers/find", customer_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      customer = JSON.parse(response.body)
      assert_equal customer['first_name'], Customer.find_by(first_name: customer_1.first_name).first_name
    end
  end

  describe "find all" do
    it "returns all customers by the params entered into the request" do
      customer_list = create_list(:customer, 10)
      names = ['john', 'kat', "bee"].sample
      customer_list_2 = create_list(:customer, 5, {first_name: names})
      customer_params = {
                first_name: "#{customer_list.first.first_name}"
            }
      get "/api/v1/customers/find_all", customer_params, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      customers = JSON.parse(response.body)
      assert_equal 10, customers.count
      assert_equal customers.first['first_name'], Customer.find_by(first_name: customer_list.first.first_name).first_name
      refute customers.include?(customer_list_2.sample)
    end
  end
end
