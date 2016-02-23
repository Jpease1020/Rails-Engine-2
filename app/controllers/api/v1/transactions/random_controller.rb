class Api::V1::Transactions::RandomController < Api::ApiController
  respond_to :json

  def show
    rand_num = Transaction.count
    respond_with Transaction.find(rand(rand_num))
  end

end
