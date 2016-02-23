class Api::V1::TransactionsController < Api::ApiController
  respond_to :json
  def index
    respond_with Transaction.all
  end
end
