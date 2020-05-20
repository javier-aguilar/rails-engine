require 'rails_helper'

describe "Merchants-Items API v1" do
  describe "GET /api/v1/merchants/:id/items" do
    it "can return all items by a given merchant by id" do
      id = create(:merchant).id
      create_list(:item, 3, merchant_id: id)

      get "/api/v1/merchants/#{id}/items/"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:data].count).to eq(3)
      expect(item[:data].first[:attributes][:merchant_id]).to eq(id)
      expect(item[:data].last[:attributes][:merchant_id]).to eq(id)
    end
  end
end
