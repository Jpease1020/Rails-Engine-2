class Api::V1::Customers::FavoriteMerchantController < Api::ApiController
  respond_to :json

  def show
    customer_id = customer_params[:id]
    respond_with Customer.favorite_merchant(customer_id)
  end

  private
  def customer_params
    params.permit(:id)
  end

end
