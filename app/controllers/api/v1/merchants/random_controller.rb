class Api::V1::Merchants::RandomController < Api::ApiController
  respond_to :json

  def show
    rand_num = Merchant.count
    respond_with Merchant.find(rand(rand_num))
  end

end
