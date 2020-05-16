FactoryBot.define do
  factory :invoice_item do
    name { "MyString" }
    description { "MyString" }
    unit_price { 1.5 }
    merchant_id { nil }
  end
end
