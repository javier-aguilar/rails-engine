require 'rails_helper'

describe "Items API v1" do
  describe "GET /api/v1/items" do
    it "returns a list of items" do
      create_list(:item, 3)
      get '/api/v1/items'

      expect(response).to be_successful
      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].first.keys).to match_array([:id, :type, :attributes])
      expect(items[:data].count).to eq(3)
    end
  end
  describe "GET /api/v1/items/:id" do
    it "can return a single item by id" do
      id = create(:item).id
      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item[:data][:id].to_i).to eq(id)
    end
  end
  describe "POST /api/v1/items/:id" do
    it "can create a new item" do
      id = create(:merchant).id
      item_params = { name: "Strange box",
                      description: "Awesome thing!",
                      unit_price: 10.99,
                      merchant_id: id }

      post "/api/v1/items", params: item_params
      item = Item.last

      expect(response).to be_successful
      expect(item.name).to eq(item_params[:name])
    end
  end
  describe "PUT /api/v1/items/:id" do
    it "can update an existing item" do
      id = create(:item).id
      previous_name = Item.last.name
      item_params = { name: "Not so strange box" }

      put "/api/v1/items/#{id}", params: item_params
      item = Item.find_by(id: id)

      expect(response).to be_successful
      expect(item.name).to_not eq(previous_name)
      expect(item.name).to eq("Not so strange box")
    end
  end
  describe "DELETE /api/v1/items/:id" do
    it "can destroy an item" do
      item = create(:item)

      expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)
      expect(response).to be_successful
      expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
