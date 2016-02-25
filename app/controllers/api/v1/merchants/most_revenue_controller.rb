class Api::V1::Merchants::MostRevenueController < Api::ApiController
  respond_to :json

  def index
    quantity = merchant_params[:quantity].to_i
    respond_with Merchant.most_revenue(quantity)
  end

  private
  def merchant_params
    params.permit(:quantity)
  end
end
