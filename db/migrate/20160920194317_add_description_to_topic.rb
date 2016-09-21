class AddDescriptionToTopic < ActiveRecord::Migration[5.0]
  def change
    add_column :topics, :description, :text
  end
end
