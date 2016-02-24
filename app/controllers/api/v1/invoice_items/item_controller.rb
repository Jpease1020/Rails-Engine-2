class Api::V1::InvoiceItems::ItemController < Api::ApiController
  respond_to :json

  def index
    respond_with InvoiceItem.find(params[:invoice_item_id]).item
  end
end
