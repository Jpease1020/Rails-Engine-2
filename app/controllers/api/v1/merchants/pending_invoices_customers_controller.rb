class Api::V1::Merchants::PendingInvoicesCustomersController < Api::ApiController

  respond_to :json

  def index
    merchant_id = merchant_params[:id]
    respond_with Merchant.pending_invoices_customers(merchant_id)
  end

  private
  def merchant_params
    params.permit(:id)
  end
end
