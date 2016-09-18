class Question < ApplicationRecord

  belongs_to :topic
  has_many :answers, dependent: :destroy

  validates :content, presence: true, length: { minimum: 5 }

end
