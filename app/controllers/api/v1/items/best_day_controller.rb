class Api::V1::Items::BestDayController < Api::ApiController
  respond_to :json

  def show
    item_id = item_params[:id]
    respond_with Item.best_day(item_id)
    byebug
  end

  private

  def item_params
    params.permit(:id)
  end
end
