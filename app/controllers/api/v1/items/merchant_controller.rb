class Api::V1::Items::MerchantController < ApplicationController
  def index
    item = Item.find(items_params[:item_id])
    render json: MerchantSerializer.new(item.merchant,
                                        { params: { show_id: true } })
  end

  private

  def items_params
    params.permit(:item_id)
  end
end
