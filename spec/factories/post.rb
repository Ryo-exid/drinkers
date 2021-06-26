FactoryBot.define do
  factory :post do
    user_id { 1 }
    post_image_id { "MyString" }
    title { Faker::Lorem.characters(number: 10) }
    caption { Faker::Lorem.characters(number: 20) }
    rate { 3 }
    location { Faker::Lorem.characters(number: 3) }
  end
end