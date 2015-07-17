class Question < ActiveRecord::Base
  has_many :user_questions
  has_many :question_sets
  has_many :quizzes, through: :question_sets

  validates :body, presence: true
  validates :answer, presence: true
  validates  :options, presence: true
end
