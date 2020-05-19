require 'rails_helper'

describe "Merchants-Search API v1" do
  describe "GET /api/v1/merchants/find?" do
    it 'can find a single merchant that matches criteria' do
      create(:merchant, name: "Mario")
      create(:merchant, name: "Luigi")
      create(:merchant, name: "Peach")

      get "/api/v1/merchants/find?name=peach"

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json.count).to eq(1)
      expect(json[:data][:attributes][:name]).to include("Peach")
    end
  end
  describe "GET /api/v1/merchants/find_all?" do
    it 'can find a list of merchants that matches criteria' do
      create(:merchant, name: "Mario")
      create(:merchant, name: "Wario")
      create(:merchant, name: "Peach")


      get "/api/v1/merchants/find_all?name=ario"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(2)

      merchants = json[:data].map { |merchant| merchant[:attributes][:name].downcase }
      merchants.each do |name|
        expect(name).to include("ario")
      end
    end
  end
end
