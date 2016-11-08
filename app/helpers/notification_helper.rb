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
		create_notification("#{show_user_name(answer).capitalize} has answered your question!", current_member, answer.question.member, answer_notification_link(answer))
	end

	def created_question question
		create_notification("A question has been created in #{question.topic.name}", current_member, question.topic.room.owner, question_notification_link(question))
	end

	def moderated_question question
		create_notification("Your question has been moderated", question.topic.room.owner, question.member, question_notification_link(question))
	end

	def moderated_answer answer
		create_notification("Your answer has been moderated", answer.question.topic.room.owner, answer.member, answer_notification_link(answer))
	end

	def reported_question question
		create_notification("This question has been reported by #{current_member.name}", current_member, question.topic.room.owner, question_notification_link(question))
	end

	def reported_answer room
		create_notification("This answer has been reported by #{current_member.name}", current_member, answer.question.topic.room.owner, answer_notification_link(answer))
	end

	def joined_room room
		create_notification("#{current_member.name} has just joined #{room.name}!", current_member, room.owner, room_path(room))
	end
	
	def liked_question question
		create_notification("#{current_member.name} has liked your question", current_member, question.member, question_notification_link(question))
	end

	def liked_answer answer
		create_notification("#{current_member.name} has liked your answer", current_member, answer.member, answer_notification_link(answer))
	end

	def create_notification message, sender, receiver, link
		Notification.create(message: message, sender: sender, receiver: receiver, link: link)
	end

	def show_user_name object
		object.anonymous? ? "someone" : current_member.name
	end

	def question_notification_link question
		topic_path(question.topic, anchor: "question-#{question.id}")
	end

	def answer_notification_link answer
		topic_path(answer.question.topic, anchor: "answer-#{answer.id}")
	end

end
