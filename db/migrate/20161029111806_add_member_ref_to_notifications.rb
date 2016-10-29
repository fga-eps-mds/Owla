class AddMemberRefToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :member_sender, index:true
    add_reference :notifications, :member_receiver, index:true
  end
end
