class Api::V1::Invoices::MerchantController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.find(params[:invoice_id]).merchant
  end
end
