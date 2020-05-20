class Api::V1::RevenueController < ApplicationController
  def index
    value = Invoice.revenue_by_dates(date_params)
    render json: RevenueSerializer.new(Revenue.new(value.first))
  end

  private

  def date_params
    params.permit(:start, :end)
  end
end
