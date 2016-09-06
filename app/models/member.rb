class Member < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, length: {maximum:60, minimum:4}
  validates :password, presence:true,length: {minimum:5, maximum: 15}
  validates :email, presence:true, length: {maximum: 255}, format: { with: VALID_EMAIL }, uniqueness: {case_sensitive: false }
end
