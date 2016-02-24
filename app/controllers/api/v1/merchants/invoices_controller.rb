class Api::V1::Merchants::InvoicesController < Api::ApiController
  respond_to :json
  def index
    merchant = Merchant.find(params[:merchant_id])
    respond_with merchant.invoices
  end
end
