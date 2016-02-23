class Api::V1::Invoices::FindController < Api::ApiController
  respond_to :json

  def show
    respond_with Invoice.find_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id, :status, :created_at, :updated_at, :customer_id, :merchant_id)
  end
end
