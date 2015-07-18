class Question < ActiveRecord::Base
  has_many :user_questions

  validates :body, presence: true
  validates :answer, presence: true
  validates  :options, presence: true

  def next
    result = (Questions.all - UserQuestions.all).shuffle!
    result.pop
  end
end
