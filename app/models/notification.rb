class Notification < ApplicationRecord
	
	belongs_to :receiver, class_name: 'Member', foreign_key: 'receiver_id'

	validates :message, presence: true, length: {minimum: 5, maximum: 50}

end
