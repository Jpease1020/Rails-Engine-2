class Api::V1::Items::MerchantController < Api::ApiController
  respond_to :json

  def index
    respond_with Item.find(params[:item_id]).merchant
  end
end
