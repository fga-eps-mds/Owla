class Room < ApplicationRecord

  has_many :topics, dependent: :destroy
  has_and_belongs_to_many :members

  validates :name, presence: true, length: { maximum: 255, minimum: 2 }
  validates :description, presence: true, length: { maximum: 240, minimum: 2 }

end
