class Room < ApplicationRecord
  validates :name, presence: true, length: {maximum:255, minimum:2}
  has_many :topics
  has_many :memberships
  has_many :members, through: :memberships
  #has_many :topics
  
end
