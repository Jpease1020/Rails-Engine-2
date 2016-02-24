class Api::V1::Invoices::InvoiceItemsController < Api::ApiController
  respond_to :json

  def index
    invoice = Invoice.find(params[:invoice_id])
    respond_with invoice.invoice_items
  end

end
