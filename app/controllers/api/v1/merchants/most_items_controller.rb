class Api::V1::Merchants::MostItemsController < ApplicationController
  def index
    merchants = Merchant.most_items(merchant_params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  private

  def merchant_params
    params.permit(:quantity)
  end
end
