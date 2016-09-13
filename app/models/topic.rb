class Topic < ApplicationRecord

	vallidates :name, presence: true, length: { minimum: 4 maximum: 15 }
	#has_many :questions
	#has_many :answers

end
