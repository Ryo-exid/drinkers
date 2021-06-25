FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number:10) }
    birth_date { "1996-1-1" }
    email { Faker::Internet.email }
    postcode { "1111111" }
    address_city { Faker::Lorem.characters(number:10) }
    address_street { "1-1-1" }
    address_building { Faker::Lorem.characters(number:10) }
    password { "password" }
    password_confirmation { "password" }
  end
end