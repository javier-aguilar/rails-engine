require 'rails_helper'

describe "Items-Merchant API v1" do
  describe "GET /api/v1/items/:id/merchant" do
    it "can return a single merchant by item id" do
      merchant = create(:merchant)
      item = create(:item, merchant_id: merchant.id)

      get "/api/v1/items/#{item.id}/merchant/"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:data][:id].to_i).to eq(merchant.id)
    end
  end
end
