class Api::V1::Customers::FindController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find_by(customer_params)
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
