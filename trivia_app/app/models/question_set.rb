class QuestionSet < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :question

  def current
    set = Questions.all
    set.shuffle![0..4]
  end
end
