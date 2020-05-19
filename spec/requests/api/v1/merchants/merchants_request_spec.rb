require 'rails_helper'

describe "Merchants API v1" do
  describe "GET /api/v1/merchants" do
    it "returns a list of merchants" do
      create_list(:merchant, 3)
      get '/api/v1/merchants'

      expect(response).to be_successful
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].first.keys).to match_array([:id, :type, :attributes])
      expect(merchants[:data].count).to eq(3)
    end
  end
  describe "GET /api/v1/merchants/:id" do
    it "can return a single merchant by id" do
      id = create(:merchant).id
      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:data][:id].to_i).to eq(id)
    end
  end
  describe "POST /api/v1/merchants/:id" do
    it "can create a new merchant" do
      merchant_params = { name: "Saw" }

      post "/api/v1/merchants", params: merchant_params
      merchant = Merchant.last

      expect(response).to be_successful
      expect(merchant.name).to eq(merchant_params[:name])
    end
  end
  describe "PUT /api/v1/merchants/:id" do
    it "can update an existing merchant" do
      id = create(:merchant).id
      previous_name = Merchant.last.name
      merchant_params = { name: "Sledge" }

      put "/api/v1/merchants/#{id}", params: merchant_params
      merchant = Merchant.find_by(id: id)

      expect(response).to be_successful
      expect(merchant.name).to_not eq(previous_name)
      expect(merchant.name).to eq("Sledge")
    end
  end
  describe "DELETE /api/v1/merchants/:id" do
    it "can destroy an merchant" do
      merchant = create(:merchant)

      expect{ delete "/api/v1/merchants/#{merchant.id}" }.to change(Merchant, :count).by(-1)
      expect(response).to be_successful
      expect{Merchant.find(merchant.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
