# require 'rails_helper'
#
# describe "customers" do
#   describe "find" do
#     it "returns a customer by the params entered into the request" do
#       customer = create(:customer, {first_name: "Jeffy"})
#       customer_list = create_list(:customer, 10)
#       customer_params = {
#                 id: "#{customer.id}"
#             }
#
#       #       request_headers = {
#       #         "Accept" => "application/json",
#       #         # "Content-Type" => "application/json"
#       #       }
#       #       , customer_params, request_headers
#       get "/api/v1/customers/find", customer_params, { "Accept" => "application/json" }
#       expect(response.status).to eq 200
#       # byebug
#       response = JSON.parse(response.body)
#       assert_equal response.first['first_name'], Customer.find_by(first_name: customer.first_name)
#     end
#   end
# end
