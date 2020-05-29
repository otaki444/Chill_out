FactoryBot.define do
  factory :post do
  	user
    title { Faker::Lorem.characters(number:20) }
    article { Faker::Lorem.characters(number:100) }
  end
end
