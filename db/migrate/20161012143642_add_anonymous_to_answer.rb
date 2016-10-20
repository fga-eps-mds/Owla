class AddAnonymousToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :anonymous, :boolean, default: false
  end
end
