class CreateMembersAndRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :members_rooms, id: false do |t|
      t.belongs_to :member, index: true
      t.belongs_to :room, index: true
    end
  end
end