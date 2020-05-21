require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :items}
    it {should have_many :invoices}
    it {should have_many :invoice_items}
    it {should have_many :transactions}
  end

  describe ".filter_by_name" do
    it "includes merchants with matching name" do
      merchant_1 = create(:merchant, name: "Bob")
      merchant_2 = create(:merchant, name: "Sarah")
      expect(Merchant.filter_by_name("Bob")).to include(merchant_1)
      expect(Merchant.filter_by_name("Bob")).to_not include(merchant_2)
    end
  end

  describe ".filter_by_created_at" do
    it "includes merchants with matching created_at date" do
      merchant_1 = create(:merchant, created_at: "2020-01-02")
      merchant_2 = create(:merchant, created_at: "2020-01-04")
      expect(Merchant.filter_by_created_at("2020-01-02")).to include(merchant_1)
      expect(Merchant.filter_by_created_at("2020-01-02")).to_not include(merchant_2)
    end
  end

  describe ".filter_by_updated_at" do
    it "includes merchants with matching updated_at date" do
      merchant_1 = create(:merchant, updated_at: "2020-01-02")
      merchant_2 = create(:merchant, updated_at: "2020-01-04")
      expect(Merchant.filter_by_updated_at("2020-01-02")).to include(merchant_1)
      expect(Merchant.filter_by_updated_at("2020-01-02")).to_not include(merchant_2)
    end
  end

  describe ".most_revenue" do
    it "returns the top number of merchants who made the most revenue" do
      merchants = create_list(:merchant, 5)
      item1 = create(:item, merchant: merchants[0], unit_price: 100.00)
      item2 = create(:item, merchant: merchants[1], unit_price: 1.00)
      item3 = create(:item, merchant: merchants[2], unit_price: 1.00)
      item4 = create(:item, merchant: merchants[3], unit_price: 9.00)
      item5 = create(:item, merchant: merchants[4], unit_price: 8.00)
      invoice1 = create(:invoice, merchant: merchants[0])
      invoice2 = create(:invoice, merchant: merchants[1])
      invoice3 = create(:invoice, merchant: merchants[2])
      invoice4 = create(:invoice, merchant: merchants[3])
      invoice5 = create(:invoice, merchant: merchants[4])
      create(:invoice_item, item: item1, invoice: invoice1, quantity: 1, unit_price: item1.unit_price)
      create(:invoice_item, item: item2, invoice: invoice2, quantity: 1, unit_price: item2.unit_price)
      create(:invoice_item, item: item3, invoice: invoice3, quantity: 1, unit_price: item3.unit_price)
      create(:invoice_item, item: item4, invoice: invoice4, quantity: 1, unit_price: item4.unit_price)
      create(:invoice_item, item: item5, invoice: invoice5, quantity: 1, unit_price: item5.unit_price)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice3)
      create(:transaction, invoice: invoice4)
      create(:transaction, invoice: invoice5)

      expect(Merchant.most_revenue(2)).to include(merchants[0], merchants[3])
    end
  end

  describe ".most_items" do
    it "returns the top number of merchants who sold the most items" do
      merchants = create_list(:merchant, 5)
      item1 = create(:item, merchant: merchants[0], unit_price: 100.00)
      item2 = create(:item, merchant: merchants[1], unit_price: 1.00)
      item3 = create(:item, merchant: merchants[2], unit_price: 1.00)
      item4 = create(:item, merchant: merchants[3], unit_price: 9.00)
      item5 = create(:item, merchant: merchants[4], unit_price: 8.00)
      invoice1 = create(:invoice, merchant: merchants[0])
      invoice2 = create(:invoice, merchant: merchants[1])
      invoice3 = create(:invoice, merchant: merchants[2])
      invoice4 = create(:invoice, merchant: merchants[3])
      invoice5 = create(:invoice, merchant: merchants[4])
      create(:invoice_item, item: item1, invoice: invoice1, quantity: 10, unit_price: item1.unit_price)
      create(:invoice_item, item: item2, invoice: invoice2, quantity: 2, unit_price: item2.unit_price)
      create(:invoice_item, item: item3, invoice: invoice3, quantity: 3, unit_price: item3.unit_price)
      create(:invoice_item, item: item4, invoice: invoice4, quantity: 1, unit_price: item4.unit_price)
      create(:invoice_item, item: item5, invoice: invoice5, quantity: 1, unit_price: item5.unit_price)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice3)
      create(:transaction, invoice: invoice4)
      create(:transaction, invoice: invoice5)

      expect(Merchant.most_items(3)).to include(merchants[0], merchants[2], merchants[1])
    end
  end

  describe ".most_items" do
    it "returns the top number of merchants who sold the most items" do
      merchants = create_list(:merchant, 3)
      item1 = create(:item, merchant: merchants[0], unit_price: 100.00)
      item2 = create(:item, merchant: merchants[1], unit_price: 1.00)
      item3 = create(:item, merchant: merchants[2], unit_price: 1.00)
      invoice1 = create(:invoice, merchant: merchants[0])
      invoice2 = create(:invoice, merchant: merchants[1])
      invoice3 = create(:invoice, merchant: merchants[2])
      create(:invoice_item, item: item1, invoice: invoice1, quantity: 10, unit_price: item1.unit_price)
      create(:invoice_item, item: item2, invoice: invoice2, quantity: 2, unit_price: item2.unit_price)
      create(:invoice_item, item: item3, invoice: invoice3, quantity: 3, unit_price: item3.unit_price)
      create(:transaction, invoice: invoice1)
      create(:transaction, invoice: invoice2)
      create(:transaction, invoice: invoice3)

      expect(Merchant.revenue_by_merchant(merchants[0].id)).to eq [1000]
    end
  end

end
