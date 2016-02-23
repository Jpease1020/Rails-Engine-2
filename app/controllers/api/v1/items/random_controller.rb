class Api::V1::Items::RandomController < Api::ApiController
  respond_to :json

  def show
    rand_num = Item.count
    respond_with Item.find(rand(rand_num))
  end

end
