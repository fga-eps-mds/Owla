class AddMemberReferencesToNotification < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :member, foreign_key: true, index: true
  end
end
