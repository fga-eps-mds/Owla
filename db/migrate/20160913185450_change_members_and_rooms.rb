class ChangeMembersAndRooms < ActiveRecord::Migration[5.0]
  def change
  	create_table :members_rooms do |t|
      t.belongs_to :rooms, index: true
      t.belongs_to :members, index: true
    end
  end
end
