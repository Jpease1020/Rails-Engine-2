class Api::V1::Merchants::FavoriteCustomerController < Api::ApiController

  respond_to :json

  def show
    merchant_id = merchant_params[:id]
    respond_with Merchant.favorite_customer(merchant_id)
  end

  private
  def merchant_params
    params.permit(:id)
  end
end
