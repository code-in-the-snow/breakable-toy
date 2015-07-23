require 'byebug'

class Question < ActiveRecord::Base
  has_many :user_questions

  validates :body, presence: true
  validates :answer, presence: true
  validates  :options, presence: true

  def self.next
    result = (Question.all.to_a - UserQuestion.all.to_a)
    result.sample
  end

  def answers
    array = options << answer
    array.shuffle!
  end
end
