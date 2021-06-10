class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 投稿タイトル/場所検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title || location LIKE?", "#{word}")
    elsif search == "forward_match"
      @post = Post.where("title || location LIKE?", "#{word}%")
    elsif search == "back_word_match"
      @post = Post.where("title || location LIKE?", "%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title || location LIKE?", "%#{word}%")
    else
      @post = Post.all
    end
  end
end
