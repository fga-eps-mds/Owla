class Question < ApplicationRecord
    has_many :answer
  validates :content, presence: true, length:{minimum: 5}
end
