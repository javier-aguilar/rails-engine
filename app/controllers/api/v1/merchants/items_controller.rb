class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    merchant = Merchant.find(merchant_params[:merchant_id])
    render json: ItemSerializer.new(merchant.items)
  end

  private

  def merchant_params
    params.permit(:merchant_id)
  end
end
