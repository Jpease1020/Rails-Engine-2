class Api::V1::Customers::RandomController < Api::ApiController
  respond_to :json

  def show
    rand_num = Customer.count
    respond_with Customer.find(rand(rand_num))
  end

end
