require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it {should validate_presence_of :credit_card_number}
    it {should validate_presence_of :result}
  end

  describe 'relationships' do
    it {should belong_to :invoice}
  end

  describe ".successful" do
    it "includes transactions with result equals successful" do
      transaction_1 = create(:transaction, result: "success")
      transaction_2 = create(:transaction, result: "failed")
      expect(Transaction.successful).to include(transaction_1)
      expect(Transaction.successful).to_not include(transaction_2)
    end
  end

  describe ".unsuccessful" do
    it "includes transactions with result equals failed" do
      transaction_1 = create(:transaction, result: "success")
      transaction_2 = create(:transaction, result: "failed")
      expect(Transaction.unsuccessful).to include(transaction_2)
      expect(Transaction.unsuccessful).to_not include(transaction_1)
    end
  end
end
