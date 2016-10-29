class NotificationController < ApplicationController

	def index
		@notifications = current_member.notifications.reverse
	end

	def read
		render :nothing => true
		@notifications = current_member.notifications.where(read: true)
		@notifications.each do |notification|
			notification.update_attribute(:read, true)
	end

end
