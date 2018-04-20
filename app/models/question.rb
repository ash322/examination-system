class Question < ApplicationRecord
#attr_accessible :option_attributes
  OPTIONS_COUNT_MIN = 1

  has_many :options ,dependent: :destroy
  accepts_nested_attributes_for :options#, allow_destroy: true, reject_if: :all_blank
  belongs_to :paper#, foreign_key: 'exam', primary_key: 'exam'
  has_one :test ,through: :paper

  validate do
    check_options_number
  end

  private

  def options_count_valid?
    options.count >= OPTIONS_COUNT_MIN
  end

  def check_options_number
    unless options_count_valid?
      errors.add(:base, :Atleast_two_options, :count => OPTIONS_COUNT_MIN)
    end
  end
end
