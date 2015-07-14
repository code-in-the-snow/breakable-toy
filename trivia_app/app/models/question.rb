class Question < ActiveRecord::Base
  has_many :question_sets
  has_many :quizzes, through: :question_sets

  validates :body, presence: true
  validates :answer, presence: true
end
