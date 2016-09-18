class Question < ApplicationRecord

  has_many :answers
  belongs_to :topic

  validates :content, presence: true, length: { minimum: 5 }

end
