class Option < ApplicationRecord
  #attr_accessible :question_id, :body
  # validates :question_id,:body, presence: true
  belongs_to :question
end
