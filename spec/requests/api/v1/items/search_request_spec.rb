require 'rails_helper'

describe "Items-Search API v1" do
  describe "GET /api/v1/items/find?" do
    it 'can find a single item that matches criteria' do
      create_list(:item, 2, name: "Fire Sword")
      create_list(:item, 2, name: "Ice Shields")

      get "/api/v1/items/find?name=sword"

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json.count).to eq(1)
      expect(json[:data][:attributes][:name]).to include("Sword")
    end
  end
  describe "GET /api/v1/items/find_all?" do
    it 'can find a list of items that matches criteria' do
      create_list(:item, 2, name: "Fire Sword")
      create_list(:item, 2, name: "Ice sword", unit_price: 10.99)
      create_list(:item, 4, name: "Iron Sword", description: "Awesome-o!")

      get "/api/v1/items/find_all?name=sword"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(8)

      items = json[:data].map { |item| item[:attributes][:name].downcase }
      items.each do |name|
        expect(name).to include("sword")
      end

      get "/api/v1/items/find_all?name=sword&description=awesome-o"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(4)

      items = json[:data].map { |item| item[:attributes][:description].downcase }
      items.each do |description|
        expect(description).to include("awesome-o")
      end

      get "/api/v1/items/find_all?name=sword&unit_price=10.99"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(2)

      items = json[:data].map { |item| item[:attributes][:unit_price] }
      items.each do |unit_price|
        expect(unit_price).to eq(10.99)
      end
    end
  end
end
