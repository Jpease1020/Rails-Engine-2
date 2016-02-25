class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    date = revenue_params[:date]
    respond_with Merchant.revenue(date)
  end

  private
  def revenue_params
    params.permit(:date)
  end

end
