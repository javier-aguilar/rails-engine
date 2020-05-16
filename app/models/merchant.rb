class Merchant < ApplicationRecord
  validates :name, presence: true

  has_many :invoice_items, dependent: :destroy
  has_many :items, dependent: :destroy
end
