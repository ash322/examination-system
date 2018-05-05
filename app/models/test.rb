class Test < ApplicationRecord
  belongs_to :paper, foreign_key: 'exam_id'
  belongs_to :user
  has_many :questions, through: :paper
  has_many :responses, dependent: :destroy
  accepts_nested_attributes_for :responses
  #validates_associated :responses
  scope :created_between, lambda { |start_date, end_date| where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  before_validation :save_marks

  private

  def save_marks
    self.marks_obtained = 0
    total_marks = 0
    responses.each do |t|
      total_marks += t.question.total_marks
      self.marks_obtained += t.question.total_marks if t.response.present?
    end
    percentage = (self.marks_obtained*100)/(total_marks)
    self.result = (percentage >= 70)
  end
end
