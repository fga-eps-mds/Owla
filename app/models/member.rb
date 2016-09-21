class Member < ApplicationRecord

  has_and_belongs_to_many :rooms
  has_many :topics
  has_many :questions
  has_many :answers

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: 255, minimum: 3 }
  validates :alias, presence: true, length: { maximum: 40, minimum: 1 }, uniqueness: true
  validates :email, presence:true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum:15, minimum: 6 }, if: :password_digest_changed?
  validates :password_confirmation, presence: true, length: { maximum:15, minimum: 6 }, if: :password_digest_changed?

  has_secure_password

end
