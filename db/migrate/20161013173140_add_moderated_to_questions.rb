class AddModeratedToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :moderated, :boolean, default: :false
  end
end
