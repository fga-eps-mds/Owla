class Question < ApplicationRecord
  validates :content, presence: true, length:{minimum: 5}
end
