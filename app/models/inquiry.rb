class Inquiry < ApplicationRecord
  validates :name, { presence: { message: "を入力してください（20文字以内）" }, length: { maximum: 20 } }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze # 正規表現
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX } }
  validates :message, { presence: true, length: { maximum: 500 } }
end
