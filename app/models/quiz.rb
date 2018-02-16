class Quiz < ApplicationRecord
  has_many :questions
  has_many :user_answers, through: :questions
end
