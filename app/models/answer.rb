class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :member
  has_one :report

  validates :content, presence: true, length: { minimum: 1 }

end
