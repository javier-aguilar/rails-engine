class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy
  has_many :transactions, dependent: :destroy

  def self.revenue_by_dates(dates)
    joins(:invoice_items, :transactions)
      .merge(Transaction.successful)
      .where('invoices.created_at BETWEEN ? AND ?',
             Date.parse(dates[:start]).beginning_of_day,
             Date.parse(dates[:end]).end_of_day)
      .pluck('SUM(invoice_items.quantity * invoice_items.unit_price) AS rev')
  end
end
