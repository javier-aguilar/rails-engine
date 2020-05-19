class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy
  has_many :transactions, dependent: :destroy
end
