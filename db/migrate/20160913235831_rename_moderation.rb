class RenameModeration < ActiveRecord::Migration[5.0]
  def change
  	rename_table :moderation, :moderations
  end
end
