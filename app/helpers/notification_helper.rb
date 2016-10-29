module NotificationHelper

	def first_notification
		notification = Notification.create(message: "Welcome to Owla!", read: false, link: new_member_path, sender: "Owla Team")
		current_member.notifications << notification
	end

	def answered_question
		notification = Notification.create(message: "#{current_member.name} has answered your question!", read: false, link: answered_path, sender: current_member.name)
		question.notifications << notification
	end

	def moderated_question
		if moderated_question == true 
			notification = Notification.create(message: "Your question has been moderated", read:false, link: moderate_question_path, sender: room.owner)
			question.notifications << notification 
		end
	end

	def moderated_answer
		if moderated_answer == true
			notification = Notification.create(message: "Your answer has been moderated", read: false, link: moderate_answer_path, sender: room.owner)
			answer.notifications << notification
		end
	end

	def joined_room
		if current_member.joined_room
			notification = Notification.create(message: "You have joined a new Room", read: false, link: rooms_signup, sender: "Owla")
			current_member.notifications << notification
		end
	end

	
end
