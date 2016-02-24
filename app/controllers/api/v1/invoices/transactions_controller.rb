class Api::V1::Invoices::TransactionsController < Api::ApiController
  respond_to :json

  def index
    invoice = Invoice.find(params[:invoice_id])
    respond_with invoice.transactions
  end

end
