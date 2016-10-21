class Report < ApplicationRecord
  has_and_belongs_to_many :members
  belongs_to :question
  belongs_to :answer
end
