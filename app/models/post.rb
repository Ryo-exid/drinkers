class Post < ApplicationRecord
  belongs_to :user
  attachment :post_image
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

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

  # ランキング機能
  def self.create_all_ranks
    Post.find(Favorite.group(:post_id).order("count(post_id) desc").limit(8).pluck(:post_id))
  end

  # 通知機能
  def create_notification_by(current_user)
    notification = current_user.active_notifications.new(
      post_id: id,
      visited_id: user_id,
      action: "favorite"
    )
    
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, post_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = PostComment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, post_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, post_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, post_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      post_comment_id: post_comment_id,
      visited_id: visited_id,
      action: 'post_comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visiter_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
