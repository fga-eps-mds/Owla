module NotificationHelper
	# FIXME links to notifications

	def send_notification method, args
		self.send(method, args)
	end

	def first_notification
		# FIXME who's gonna send this notification?
		create_notification("Welcome to Owla!", Member.first, current_member)
	end

	def answered_question answer
		create_notification("#{show_user_name(answer).capitalize} has answered your question!", current_member, answer.question.member)
	end

	def created_question topic
		create_notification("A question has been created in #{topic.name}", current_member, topic.room.owner)
	end

	def moderated_question question
		create_notification("Your question has been moderated", question.topic.room.owner, question.member)
	end

	def moderated_answer answer
		create_notification("Your answer has been moderated", answer.question.topic.room.owner, answer.member)
	end

	def reported_question room
		create_notification("This question has been reported by #{current_member.name}", current_member, room.owner)
	end

	def reported_answer room
		create_notification("This answer has been reported by #{current_member.name}", current_member, room.owner)
	end

	def joined_room room
		create_notification("#{current_member.name} has just joined #{room.name}!", current_member, room.owner)
	end
	
	def liked_question question
		create_notification("#{current_member.name} has liked your question", current_member, question.member)
	end

	def liked_answer answer
		create_notification("#{current_member.name} has liked your answer", current_member, answer.member)
	end

	def create_notification message, sender, receiver
		Notification.create(message: message, sender: sender, receiver: receiver)
	end

	def show_user_name object
		object.anonymous? ? "someone" : current_member.name
	end

end
