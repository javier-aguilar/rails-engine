class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.most_revenue(merchants_params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.revenue_by_merchant(merchants_params[:id])
    render json: RevenueSerializer.new(Revenue.new(merchant.first))
  end

  private

  def merchants_params
    params.permit(:quantity, :id)
  end
end
