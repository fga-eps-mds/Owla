class Room < ApplicationRecord
  has_many :topics
  has_many :memberships
  has_many :members, through: :memberships
  validates :name, presence: true, length: {maximum:255, minimum:2}
  
  validates :name, presence: true, length: {maximum:255, minimum:2}

end
