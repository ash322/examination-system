class Test < ApplicationRecord
  belongs_to :paper, foreign_key: 'exam_id'
  belongs_to :user
  has_many :questions, through: :paper
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses
  validates_associated :responses
  scope :created_between, lambda { |start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}
end
