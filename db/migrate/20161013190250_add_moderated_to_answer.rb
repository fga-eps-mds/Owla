class AddModeratedToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :moderated, :boolean, default: :false
  end
end
