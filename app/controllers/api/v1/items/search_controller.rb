class Api::V1::Items::SearchController < ApplicationController
  def index
    items = Item.filter(search_params)
    render json: ItemSerializer.new(items)
  end

  def show
    items = Item.filter(search_params)
    render json: ItemSerializer.new(items.first)
  end

  private

  def search_params
    params.permit(:name, :description, :unit_price, :created_at, :updated_at)
  end
end
