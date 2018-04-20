class Test < ApplicationRecord
  belongs_to :paper, foreign_key: 'exam_id'
  has_many :questions, through: :paper
  accepts_nested_attributes_for :questions
end
