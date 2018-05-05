class Response < ApplicationRecord
  belongs_to :question
  belongs_to :test
  belongs_to :option, foreign_key: 'response',optional: true
  scope :find_response, lambda{ |test_id, question_id| where( "test_id = ? AND question_id = ?", test_id, question_id )}
end
