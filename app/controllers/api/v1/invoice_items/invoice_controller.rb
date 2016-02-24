class Api::V1::InvoiceItems::InvoiceController < Api::ApiController
  respond_to :json

  def index
    respond_with InvoiceItem.find(params[:invoice_item_id]).invoice
  end
end
