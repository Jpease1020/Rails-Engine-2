class Api::V1::Items::FindController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(item_params)
  end

  private

  def item_params
    params.permit(:name,
                  :description,
                  :unit_price,
                  :created_at,
                  :updated_at,
                  :merchant_id)
  end
end
