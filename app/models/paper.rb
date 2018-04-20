class Paper < ApplicationRecord
  has_many :questions
  has_many :tests, foreign_key: 'exam_id'
end
