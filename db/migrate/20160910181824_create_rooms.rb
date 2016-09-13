class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.belongs_to :member, index:true
      t.timestamps
    end

    create_table :topics do |t|
    	t.belongs_to :room, index:true 

    	t.timestamps
    end 
    
		create_table :rooms_members do |t|
      t.belongs_to :rooms, index: true
      t.belongs_to :members, index: true
    end
  end
end
