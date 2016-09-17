class Answer < ApplicationRecord
    validates :content, presence: true, length:{minimum: 1}  
    belongs_to :question
end
