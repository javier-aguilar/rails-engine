FactoryBot.define do
  factory :invoice_item do
    unit_price { Faker::Number.decimal(l_digits: 2) }
    quantity { 1 }
    item
    invoice
  end
end
