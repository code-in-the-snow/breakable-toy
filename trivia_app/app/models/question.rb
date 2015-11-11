class Question < ActiveRecord::Base
  has_many :user_questions

  validates :body, presence: true
  validates :answer, presence: true
  validates  :options, presence: true

  def answers
    array = options << answer
    array.shuffle!
  end
end
