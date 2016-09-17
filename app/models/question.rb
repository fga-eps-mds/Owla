class Question < ApplicationRecord
  validates :content, presence: true, length:{minimum: 5}
  has_many :answer
  belongs_to :topic
end
