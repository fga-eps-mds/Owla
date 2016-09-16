class Topic < ApplicationRecord

	validates :name, presence: true, length: { maximum: 15, minimum: 2 }, uniqueness: {case_sensitive: false } 
	#has_many :questions
	#has_many :answers
end
