class AddOwnerIdToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :owner_id, :integer
  end
end
