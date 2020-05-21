require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
  end

  describe 'relationships' do
    it {should belong_to :merchant}
  end

  describe ".filter_by_name" do
    it "includes items with matching name" do
      item_1 = create(:item, name: "Toy Robot")
      item_2 = create(:item, name: "Playing Cards")
      expect(Item.filter_by_name("toy")).to include(item_1)
      expect(Item.filter_by_name("toy")).to_not include(item_2)
    end
  end

  describe ".filter_by_description" do
    it "includes items with matching description" do
      item_1 = create(:item, description: "Robot")
      item_2 = create(:item, description: "Robot Dog")
      expect(Item.filter_by_description("ob")).to include(item_1, item_2)
    end
  end

  describe ".filter_by_unit_price" do
    it "includes items with matching unit price" do
      item_1 = create(:item, unit_price: 5.99)
      item_2 = create(:item, unit_price: 2.99)
      expect(Item.filter_by_unit_price(5.99)).to include(item_1)
      expect(Item.filter_by_unit_price(5.99)).to_not include(item_2)
    end
  end

  describe ".filter_by_created_at" do
    it "includes items with matching created_at date" do
      item_1 = create(:item, created_at: "2020-01-02")
      item_2 = create(:item, created_at: "2020-01-04")
      expect(Item.filter_by_created_at("2020-01-02")).to include(item_1)
      expect(Item.filter_by_created_at("2020-01-02")).to_not include(item_2)
    end
  end

  describe ".filter_by_updated_at" do
    it "includes items with matching updated_at date" do
      item_1 = create(:item, updated_at: "2020-01-02")
      item_2 = create(:item, updated_at: "2020-01-04")
      expect(Item.filter_by_updated_at("2020-01-02")).to include(item_1)
      expect(Item.filter_by_updated_at("2020-01-02")).to_not include(item_2)
    end
  end
end
