class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    date = revenue_params[:date]
    respond_with Merchant.all_merchant_revenue(date)
  end

  def show
    # respond_with Merchant.find(params[:id]).revenue
    if revenue_params[:date]
      date = revenue_params[:date]
      respond_with Merchant.revenue_by_date(params[:id], date)
    else
      respond_with Merchant.revenue(params[:id])
    end
  end

  private
  def revenue_params
    params.permit(:date)
  end

end
