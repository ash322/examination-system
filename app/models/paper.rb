class Paper < ApplicationRecord
  has_many :questions#, dependent: :destroy
  has_many :tests, foreign_key: 'exam_id'#, dependent: :destroy
end
