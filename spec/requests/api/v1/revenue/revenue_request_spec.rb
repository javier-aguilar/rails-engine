require 'rails_helper'

describe "Revenue" do
  describe "GET /api/v1/revenue?start=<start_date>&end=<end_date>" do
    it 'can return the total revenue between two given dates' do
      items = create_list(:item, 2)
      invoices = create_list(:invoice, 2, created_at: '2020-01-02')
      create(:invoice_item, invoice: invoices.first, item: items.first, quantity: 1, unit_price: 2.50)
      create(:invoice_item, invoice: invoices.last, item: items.last, quantity: 1, unit_price: 2.50)
      create(:transaction, invoice: invoices.first)
      create(:transaction, invoice: invoices.last)

      items = create_list(:item, 2)
      invoices = create_list(:invoice, 2, created_at: '2020-03-15')
      create(:invoice_item, invoice: invoices.first, item: items.first, quantity: 1, unit_price: 2.50)
      create(:invoice_item, invoice: invoices.last, item: items.last, quantity: 1, unit_price: 2.50)
      create(:transaction, invoice: invoices.first)
      create(:transaction, invoice: invoices.last)


      get "/api/v1/revenue?start=2020-01-01&end=2020-02-14"

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json.count).to eq(1)
      expect(json[:data][:attributes][:revenue]).to eq 5

      get "/api/v1/revenue?start=2020-01-01&end=2020-03-15"

      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json.count).to eq(1)
      expect(json[:data][:attributes][:revenue]).to eq 10
    end
  end
end
