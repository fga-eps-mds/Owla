class Notification < ApplicationRecord
  belongs_to :member

  validates :message, presence: true, length: {minimum: 5, maximum: 50}
end
