class Api::V1::Invoices::RandomController < Api::ApiController
  respond_to :json

  def show
    rand_num = Invoice.count
    respond_with Invoice.find(rand(rand_num))
  end

end
