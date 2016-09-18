class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :alias

      t.timestamps
    end
  end
end