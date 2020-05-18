FactoryBot.define do
  factory :item do
    name { Faker::Games::Zelda.item }
    description { "MyString" }
    unit_price { "" }
    merchant { nil }
  end
end
