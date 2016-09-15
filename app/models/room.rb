class Room < ApplicationRecord
  validates :name, presence: true, length:{in: 2..255}
  has_many :topics
end
