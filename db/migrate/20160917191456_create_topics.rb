class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.belongs_to :room, index:true    
      t.string :name

      t.timestamps
    end
  end
end