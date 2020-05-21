class Api::V1::RevenueController < ApplicationController
  def index
    revenue = Invoice.revenue_by_dates(date_params)
    render json: RevenueSerializer.new(Revenue.new(revenue.first))
  end

  private

  def date_params
    params.permit(:start, :end)
  end
end
