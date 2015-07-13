class Question < ActiveRecord::Base
  has_many :question_sets
  has_many :quizzes, through: :question_sets

  validates :body, presence: true
  validates :answer, presence: true
  validates :option_a, presence: true
  validates :option_b, presence: true
  validates :option_c, presence: true
  validates :option_d, presence: true
end
