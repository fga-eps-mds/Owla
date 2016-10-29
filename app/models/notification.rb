class Notification < ApplicationRecord
  belongs_to :member
  belongs_to :question
  belongs_to :answer

  validates :message, presence: true, length: {minimum: 5, maximum: 50}
end
