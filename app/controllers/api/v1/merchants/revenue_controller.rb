class Api::V1::Merchants::RevenueController < Api::ApiController
  respond_to :json

  def index
    date = revenue_params[:date]
    respond_with Merchant.all_merchant_revenue(date)
  end

  def show
    if revenue_params[:date]
      date = revenue_params[:date]
      id = revenue_params[:id]
      respond_with Merchant.revenue_by_date(id, date)
    else
      respond_with Merchant.revenue(params[:id])
    end

  end

  private
  def revenue_params
    params.permit(:id, :date)
  end

end
