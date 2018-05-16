class Question < ApplicationRecord
#attr_accessible :option_attributes
  OPTIONS_COUNT_MIN = 2

  attribute :correct_option_body, :string, default: "abcd"
  has_many :options , dependent: :destroy
  validates_associated :options
  validates :question, presence: true
  validates :total_marks, presence: true
  accepts_nested_attributes_for :options, allow_destroy: true#, reject_if: :all_blank
  has_one :test ,through: :paper
  belongs_to :paper
  belongs_to :correct_option, class_name: 'Option', optional: true
  has_many :responses
  has_many :images, as: :record, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  acts_as_paranoid

  validate do
    check_options_number
    check_unique_options
  end

  private

  def check_unique_options
    b = options.map {|e| e.body}
    if (b.count != b.uniq.count)
    errors.add(:base, :no_duplicate_options, message:"no duplicate options")
    end
  end

  def options_count_valid?
    options.length >= OPTIONS_COUNT_MIN
  end

  def check_options_number
    unless options_count_valid?
      errors.add(:base, :atleast_two_options, :count => OPTIONS_COUNT_MIN, message:"must have 2 options")
    end
  end
end
