class Option < ApplicationRecord
  #attr_accessible :question_id, :body
  #validates :question_id, presence: true
  belongs_to :question
  has_many :responses
  has_many :images, as: :record, dependent: :destroy
  # validates :body,presence: true, uniqueness: true, if: :has_unique_options
  # validates :body,presence: true, uniqueness: true, if: :has_unique_options
  validates_uniqueness_of :body, :scope => "question_id"

  private

  def has_unique_option
    question_id == self.question_id
  end
end
