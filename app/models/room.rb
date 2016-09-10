class Room < ApplicationRecord
  has_many :topics
  validates :name, presence: true, length: {maximum:255, minimum:2}

end
