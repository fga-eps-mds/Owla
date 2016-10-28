class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.text :message
      t.boolean :read

      t.timestamps
    end
  end
end
