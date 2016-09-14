class RemovePrimaryKeyMemberId < ActiveRecord::Migration[5.0]
  def change
  	remove_column :rooms, :member_id
  end
end
