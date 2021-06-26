FactoryBot.define do
  factory :notification do
    visiter_id { 1 }
    visited_id { 1 }
    post_id { 1 }
    post_comment_id { 1 }
    chat_id { 1 }
    room_id { 1 }
  end
end