class Api::V1::InvoiceItems::RandomController < Api::ApiController
  respond_to :json

  def show
    rand_num = InvoiceItem.count
    respond_with InvoiceItem.find(rand(rand_num))
  end

end
