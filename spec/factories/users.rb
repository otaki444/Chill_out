FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:20) }
    name_kana { "テスト" }
    nickname { Faker::Lorem.characters(number:20) }
    email { Faker::Internet.email }
    one_word { Faker::Lorem.characters(number:20) }
    introduction { Faker::Lorem.characters(number:50) }
    password { "password" }
    password_confirmation { "password" }
  end
end
