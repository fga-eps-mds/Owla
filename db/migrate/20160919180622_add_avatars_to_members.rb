class AddAvatarsToMembers < ActiveRecord::Migration[5.0]
	def up
		add_attachment :members, :avatar
	end

	def down
		remove_attachment :members, :avatar
	end
end
