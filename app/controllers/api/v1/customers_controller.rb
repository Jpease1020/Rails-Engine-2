class Api::V1::CustomersController < Api::ApiController
  respond_to :json
  def index
    respond_with Customer.all
  end
end
