class AddAvatarsToRooms < ActiveRecord::Migration[5.0]
  def up
		add_attachment :rooms, :avatar
	end

	def down
		remove_attachment :rooms, :avatar
	end
end
