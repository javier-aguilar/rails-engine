class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def create
    render json: MerchantSerializer.new(Merchant.create(merchant_params))
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id],
                                                        merchant_params))
  end

  def destroy
    render json: MerchantSerializer.new(Merchant.destroy(params[:id]))
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
