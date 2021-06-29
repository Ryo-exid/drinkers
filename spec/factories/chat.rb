FactoryBot.define do
  factory :chat do
    user_id { 1 }
    room_id { 1 }
    message { Faker::Lorem.characters(number: 10) }
  end
end
