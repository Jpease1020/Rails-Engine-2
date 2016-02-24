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
end
