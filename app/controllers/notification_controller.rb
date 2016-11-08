class NotificationController < ApplicationController

	def index
		@notifications = current_member.notifications.reverse

    @notifications.each do |p| { p.update_attribute(:read, true) }
	end

end
