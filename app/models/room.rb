class Room < ApplicationRecord
  validates :name, presence: true, length {maximum:255, minimum:2}

end
