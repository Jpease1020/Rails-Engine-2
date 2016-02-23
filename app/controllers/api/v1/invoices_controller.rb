class Api::V1::InvoicesController < Api::ApiController
  respond_to :json
  def index
    respond_with Invoice.all
  end
end
