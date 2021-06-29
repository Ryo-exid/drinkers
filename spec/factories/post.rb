FactoryBot.define do
  factory :post do
    user_id { 1 }
    post_image_id { "MyString" }
    title { "MyString" }
    caption { "MyString" }
    rate { 3 }
    location { "MyString" }
  end
end
