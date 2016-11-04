class AddPdfToTopic < ActiveRecord::Migration[5.0]
  def up
		add_attachment :topics, :slide
    add_column :topics, :slide_base64, :string
	end

	def down
		remove_attachment :topics, :slide
    remove_column :topics, :slide_base64, :string
	end
end
