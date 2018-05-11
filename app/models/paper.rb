class Paper < ApplicationRecord
  validates :name, presence: true #, message: 'must not be empty'
  has_many :questions#, dependent: :destroy
  has_many :tests, foreign_key: 'exam_id'#, dependent: :destroy
  has_many :users_papers, dependent: :destroy
  has_many :users, through: :user_papers
  acts_as_paranoid
  accepts_nested_attributes_for :questions, allow_destroy: true
end
