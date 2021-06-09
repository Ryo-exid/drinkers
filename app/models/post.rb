class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image
  has_many :favorites, dependent: :destroy

  def favorite_user(user_id)
    favorites.find_by(user_id: user.id)
  end#
end
