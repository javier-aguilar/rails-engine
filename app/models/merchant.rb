class Merchant < ApplicationRecord
  include Filterable

  validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy

  scope :filter_by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  scope :filter_by_updated_at, ->(updated_at) { where updated_at: updated_at }
  scope :filter_by_created_at, ->(created_at) { where unit_price: created_at }
end
