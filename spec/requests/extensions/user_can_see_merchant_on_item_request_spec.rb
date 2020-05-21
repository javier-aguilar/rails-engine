require 'rails_helper'

describe "Items API v1" do
  describe "GET /api/v1/items/:id" do
    it "can return a single item by id with merchant name" do
      merchant = create(:merchant)
      id = create(:item, merchant: merchant).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:data][:id].to_i).to eq(id)
      expect(item[:data][:attributes][:merchant][:name]).to eq merchant.name
    end
  end
end
