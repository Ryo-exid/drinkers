class Inquiry < ApplicationRecord
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i # 正規表現
  validates :email, {presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}}
  validates :message, presence: true
end
