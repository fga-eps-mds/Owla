class Question < ApplicationRecord

  belongs_to :topic
  belongs_to :member
  has_many :answers, dependent: :destroy

  validates :content, presence: true, length: { minimum: 5 }

  has_attached_file :attachment

  validates_attachment_file_name :attachment, :matches => [/^.*\.(doc|docx|odp|ods|odt|pdf|ppt|pptx|xls|xlsx|jpeg|jpg|png)$/]

end
