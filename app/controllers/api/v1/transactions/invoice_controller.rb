class Api::V1::Transactions::InvoiceController < Api::ApiController
  respond_to :json

  def index
    respond_with Transaction.find(params[:transaction_id]).invoice
  end

end
