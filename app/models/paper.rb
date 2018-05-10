class Paper < ApplicationRecord
  validates :name, presence: true #, message: 'must not be empty'
  has_many :questions#, dependent: :destroy
  has_many :tests, foreign_key: 'exam_id'#, dependent: :destroy
  acts_as_paranoid
end
