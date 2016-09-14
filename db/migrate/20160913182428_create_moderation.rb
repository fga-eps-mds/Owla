class CreateModeration < ActiveRecord::Migration[5.0]
  def change
  	create_table :moderation do |t|
      t.references :rooms, :member
      t.timestamps
    end
  end
end
