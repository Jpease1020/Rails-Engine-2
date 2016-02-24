class Api::V1::Invoices::CustomerController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:invoice_id]).customer
  end
end
