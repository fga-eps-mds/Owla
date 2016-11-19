class AddColorAttributeToTags < ActiveRecord::Migration[5.0]
  def change
  	add_column :tags, :color, :string 
  end
end
