class Tag < ApplicationRecord
	has_and_belongs_to_many :questions

	validates :content, presence: true, length: {minimum: 2, maximum: 25} 
end
