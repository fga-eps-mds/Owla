class Topic < ApplicationRecord

  belongs_to :room
  belongs_to :member
  has_many :questions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15, minimum: 2 }, uniqueness: { case_sensitive: false } 

end
