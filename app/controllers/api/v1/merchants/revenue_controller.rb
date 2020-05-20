class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    merchants = Merchant.most_revenue(params[:quantity])
    render json: MerchantSerializer.new(merchants)
  end

  def show
    merchant = Merchant.revenue_by_merchant(params[:id])
    render json: RevenueSerializer.new(Revenue.new(merchant.first))
  end
end
