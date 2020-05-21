class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def create
    render json: ItemSerializer.new(Item.create(item_params))
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def update
    render json: ItemSerializer.new(Item.update(params[:id], item_params))
  end

  def destroy
    render json: ItemSerializer.new(Item.destroy(params[:id]))
  end

  private

  def item_params
    params.permit(:description, :name, :unit_price, :merchant_id)
  end
end
