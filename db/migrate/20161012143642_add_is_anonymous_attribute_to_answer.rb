class AddIsAnonymousAttributeToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :is_anonymous, :boolean, :default => false
  end
end
