class AddLinkSenderQuestionAndAnswerRefToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :link, :string
    add_column :notifications, :sender, :string
    add_reference :notifications, :question, index: true
    add_reference :notifications, :answer, indexr: true
  end
end
