class Room < ApplicationRecord
  has_many :topics
  validates :name, presence: true, length: {maximum:255, minimum:2}
  has_many_and_belongs_to_many :members
  #has_many :topics
  
end
