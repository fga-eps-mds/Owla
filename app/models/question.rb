class Question < ApplicationRecord
  
  acts_as_votable
  belongs_to :topic
  belongs_to :member
  has_many :answers, dependent: :destroy

  validates :content, presence: true, length: { minimum: 5 }

end
