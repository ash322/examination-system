class Option < ApplicationRecord
  #attr_accessible :question_id, :body
  #validates :question_id, presence: true
  belongs_to :question
  has_many :responses
  # validates :body,presence: true, uniqueness: true, if: :has_unique_options
  # validates :body,presence: true, uniqueness: true, if: :has_unique_options
  validates_uniqueness_of :body, :scope => "question_id"

  def has_unique_options
    question_id == self.question_id
  end
end
