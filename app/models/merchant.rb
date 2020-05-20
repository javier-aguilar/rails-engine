class Merchant < ApplicationRecord
  include Filterable

  validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  scope :filter_by_name, ->(name) { where('name ILIKE ?', "%#{name}%") }
  scope :filter_by_updated_at, ->(updated_at) { where updated_at: updated_at }
  scope :filter_by_created_at, ->(created_at) { where unit_price: created_at }

  def self.most_revenue(limit)
    select('merchants.*,
           SUM(invoice_items.quantity * invoice_items.unit_price)
           AS total_revenue')
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .group(:id)
      .order('total_revenue DESC')
      .limit(limit)
  end

  def self.most_items(limit)
    select('merchants.*, SUM(invoice_items.quantity) AS total_items')
      .joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .group(:id)
      .order('total_items DESC')
      .limit(limit)
  end

  def self.revenue_by_merchant(merchant)
    joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .where('invoices.merchant_id = ?', merchant)
      .group(:id)
      .pluck('SUM(invoice_items.quantity * invoice_items.unit_price)
              AS total_revenue')
  end
end
