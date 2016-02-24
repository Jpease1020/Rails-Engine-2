class Api::V1::Items::RevenueController < Api::ApiController

  respond_to :json
  def index
    quantity = item_params['quantity'].to_i
    respond_with Item.most_revenue(quantity)
  end

  private

  def item_params
    params.permit(:quantity)
  end
end
