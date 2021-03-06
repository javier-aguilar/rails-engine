require 'rails_helper'

describe "Revenue" do
  before do
    @merchants = create_list(:merchant, 5)
    @item1 = create(:item, merchant: @merchants[0], unit_price: 100.00)
    @item2 = create(:item, merchant: @merchants[1], unit_price: 1.00)
    @item3 = create(:item, merchant: @merchants[2], unit_price: 1.00)
    @item4 = create(:item, merchant: @merchants[3], unit_price: 9.00)
    @item5 = create(:item, merchant: @merchants[4], unit_price: 8.00)
    @invoice1 = create(:invoice, merchant: @merchants[0])
    @invoice2 = create(:invoice, merchant: @merchants[1])
    @invoice3 = create(:invoice, merchant: @merchants[2])
    @invoice4 = create(:invoice, merchant: @merchants[3])
    @invoice5 = create(:invoice, merchant: @merchants[4])
    create(:invoice_item, item: @item1, invoice: @invoice1, quantity: 1, unit_price: @item1.unit_price)
    create(:invoice_item, item: @item2, invoice: @invoice2, quantity: 1, unit_price: @item2.unit_price)
    create(:invoice_item, item: @item3, invoice: @invoice3, quantity: 1, unit_price: @item3.unit_price)
    create(:invoice_item, item: @item4, invoice: @invoice4, quantity: 1, unit_price: @item4.unit_price)
    create(:invoice_item, item: @item5, invoice: @invoice5, quantity: 1, unit_price: @item5.unit_price)
    create(:transaction, invoice: @invoice1)
    create(:transaction, invoice: @invoice2)
    create(:transaction, invoice: @invoice3)
    create(:transaction, invoice: @invoice4)
    create(:transaction, invoice: @invoice5)
  end
  describe "GET /api/v1/merchants/most_revenue?quantity=x" do
    it 'can return a number of merchants ordered by most revenue desc' do
      get "/api/v1/merchants/most_revenue?quantity=3"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json[:data].count).to eq(3)
      expect(json[:data][0][:attributes][:name]).to eq @merchants[0].name
      expect(json[:data][1][:attributes][:name]).to eq @merchants[3].name
      expect(json[:data][2][:attributes][:name]).to eq @merchants[4].name
    end
  end
  describe "GET /api/v1/merchants/:id/revenue" do
    it 'can return total revenue by merchant' do
      get "/api/v1/merchants/#{@merchants.first.id}/revenue"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(json.count).to eq(1)
      expect(json[:data][:attributes][:revenue]).to eq 100
    end
  end
end
