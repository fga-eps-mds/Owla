class AddDescriptionToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :description, :text
  end
end
