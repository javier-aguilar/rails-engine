FactoryBot.define do
  factory :customer do
    first_name { Faker::Games::Zelda.character }
    last_name { Faker::Name.last_name }
  end
end
