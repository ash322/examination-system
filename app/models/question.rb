class Question < ApplicationRecord
#attr_accessible :option_attributes
  OPTIONS_COUNT_MIN = 2

  has_many :options ,dependent: :destroy
  validates_associated :options
  accepts_nested_attributes_for :options#, allow_destroy: true, reject_if: :all_blank
  belongs_to :paper
  has_one :test ,through: :paper


  validate do
    check_options_number
  end

  private

  def options_count_valid?
    options.length >= OPTIONS_COUNT_MIN
  end

  def check_options_number
    unless options_count_valid?
      errors.add(:base, :atleast_two_options, :count => OPTIONS_COUNT_MIN)
    end
  end
end
