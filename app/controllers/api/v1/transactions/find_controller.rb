class Api::V1::Transactions::FindController < Api::ApiController
  respond_to :json

  def index
    respond_with Transaction.where(transaction_params)
  end

  def show
    respond_with Transaction.find_by(transaction_params)
  end

  private

  def transaction_params
    params.permit(:id,
                  :credit_card_expiration_date,
                  :credit_card_number,
                  :result,
                  :updated_at,
                  :created_at,
                  :invoice_id )
  end
end
