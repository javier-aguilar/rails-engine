FactoryBot.define do
  factory :invoice_item do
    name { "MyString" }
    description { "MyString" }
    unit_price { 1.5 }
    quantity { 1 }
    item { nil }
    invoice { nil }
  end
end
