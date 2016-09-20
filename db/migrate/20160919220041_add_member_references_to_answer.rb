class AddMemberReferencesToAnswer < ActiveRecord::Migration[5.0]
  def change
    add_reference :answers, :member, foreign_key: true
  end
end
