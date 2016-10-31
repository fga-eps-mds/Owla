class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.boolean :read
      t.integer :receiver_id

      t.timestamps
    end
  end
end
