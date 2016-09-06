class Member < ApplicationRecord
	before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum:60, minimum:4}
  validates :alias, presence: true, length: {maximum:40, minimum:1}
  validates :password, presence:true,length: { minimum: 6 }
  validates :email, presence:true, length: {maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false }

  has_secure_password
end
