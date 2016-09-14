class DropMembersRoommsTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :members_rooms
  end
end
