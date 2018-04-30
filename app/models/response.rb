class Response < ApplicationRecord
  belongs_to :question
  belongs_to :test
  belongs_to :option, foreign_key: 'response'
end
