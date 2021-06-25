class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :name, { presence: { message: "を入力してください（20文字以内）" }, length: { maximum: 20 } }
  validates :birth_date, :address_city, :address_street, :address_building, presence: true, on: :create
  validates :postcode, length: { is: 7 }, on: :create
  validates :postcode, numericality: { only_integer: true }, on: :create

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze # 正規表現
  validates :email, { presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX } }

  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/.freeze # 先頭から末尾まで、全て「a-zA-Z0-9_」と「-」にマッチする文字列を許容
  validates :password, length: { minimum: 6, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字で入力してください（ハイフンも使用できます)" } }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :user_rooms
  has_many :chats, dependent: :destroy
  has_many :rooms, through: :user_rooms

  # 通知機能
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

  # フォローフォロワー機能
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?", "#{word}%")
    elsif search == "back_word_match"
      @user = User.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?", "%#{word}%")
    else
      @user = User.all
    end
  end

  # 住所自動入力機能
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  # 退会したユーザはログインできない
  def active_for_authentication?
    super && (is_deleted == false)
  end

  # フォロー時の通知
  def create_notification_follow!(current_user)
    temp = Notification.where(["visiter_id = ? and visited_id = ? and action = ? ", current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
