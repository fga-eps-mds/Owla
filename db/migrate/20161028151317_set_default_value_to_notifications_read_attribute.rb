class SetDefaultValueToNotificationsReadAttribute < ActiveRecord::Migration[5.0]
  def change
  	change_column :notifications, :read, :boolean, :default => false
  end
end
