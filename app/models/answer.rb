class Answer < ApplicationRecord

  belongs_to :question
  belongs_to :member
  
  validates :content, presence: true, length: { minimum: 1 }

  has_attached_file :attachment

  validates_attachment_file_name :attachment, :matches => [/^.*\.(doc|docx|odp|ods|odt|pdf|ppt|pptx|xls|xlsx|jpeg|jpg|png)$/]

end
