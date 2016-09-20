class AddMemberReferencesToTopic < ActiveRecord::Migration[5.0]
  def change
    add_reference :topics, :member, foreign_key: true
  end
end
