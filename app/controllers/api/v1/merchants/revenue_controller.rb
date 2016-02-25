class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    date = revenue_params[:date]
    respond_with Merchant.all_merchant_revenue(date)
  end

  def show
    # respond_with Merchant.find(params[:id]).revenue

    respond_with Merchant.revenue(params[:id])
  end

  private
  def revenue_params
    params.permit(:date)
  end

end
