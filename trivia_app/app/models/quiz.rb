class Quiz < ActiveRecord::Base
  belongs_to :user
  has_many :question_sets
  has_many :quizzes, through: :question_sets

  validates :count_questions_asked, numericality: { less_than_or_equal_to: 20 }
  validates :count_right_answers, numericality: { less_than_or_equal_to: 20 }
  validates :user_id, presence: true

  def count_wrong_answers
    count_questions_asked - count_right_answers
  end

  def percent_right
    count_right_answers / 20
  end
end
