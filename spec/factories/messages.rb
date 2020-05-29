FactoryBot.define do
  factory :message do
    user
    room
    message { Faker::Lorem.characters(number:200) }
  end
end
