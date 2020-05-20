class Item < ApplicationRecord
  include Filterable

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  belongs_to :merchant

  scope :filter_by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  scope :filter_by_description, (lambda do |description|
    where('description ILIKE ?', "%#{description}%")
  end)
  scope :filter_by_unit_price, ->(unit_price) { where unit_price: unit_price }
  scope :filter_by_updated_at, ->(updated_at) { where updated_at: updated_at }
  scope :filter_by_created_at, ->(created_at) { where created_at: created_at }
end
