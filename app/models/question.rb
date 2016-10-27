class Question < ApplicationRecord

  belongs_to :topic
  belongs_to :member
  has_many :answers, dependent: :destroy

  validates :content, presence: true, length: { minimum: 5 }

  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ["application/pdf", "image/png"] }

end
