class Test < ApplicationRecord
  belongs_to :paper, foreign_key: 'exam_id'
  belongs_to :user
  has_many :questions, through: :paper
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses
end
