class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :topic, index:true    
      t.string :content

      t.timestamps
    end
  end
end