class CreateAnswers < ActiveRecord::Migration[5.0]
    def change
      create_table :answers do |t|
       t.text :content

       t.timestamps
      end

      # create_table :questions do |t|
      #  t.belongs_to :answer, index: true
      #  t.string :content
       
      #  t.timestamps
       end	
    end
end
