FactoryBot.define do
  factory :inquiry do
    name { Faker::Lorem.characters(number:6) }
    email { Faker::Internet.email }
    message { Faker::Lorem.characters(number:100) }
  end
end
