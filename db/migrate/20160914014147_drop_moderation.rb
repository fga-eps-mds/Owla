class DropModeration < ActiveRecord::Migration[5.0]
  def change
  	drop_table :moderations

  	create_table :memberships do |t|
      t.references :room, :member
      t.timestamps
    end
  end
end
