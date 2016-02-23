class Api::V1::InvoiceItems::FindController < Api::ApiController
  respond_to :json

  def index
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def show
    respond_with InvoiceItem.find_by(invoice_item_params)
  end

  private
  def invoice_item_params
    params.permit(:quantity,
                  :unit_price,
                  :created_at,
                  :updated_at,
                  :item_id,
                  :invoice_id)
  end
end
