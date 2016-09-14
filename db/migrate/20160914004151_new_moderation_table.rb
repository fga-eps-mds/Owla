class NewModerationTable < ActiveRecord::Migration[5.0]
  def change
  	drop_table :moderation

  	create_table :moderations do |t|
      t.references :room, :member
      t.timestamps
    end
  end
end
