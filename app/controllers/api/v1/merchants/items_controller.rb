class Api::V1::Merchants::ItemsController < Api::ApiController
  respond_to :json

  def index
    merchant = Merchant.find(params[:merchant_id])
    respond_with merchant.items
  end

end
