class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :member

  validates :content, presence: true, length: { minimum: 1 }

end
