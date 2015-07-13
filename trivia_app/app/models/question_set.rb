class Question_set < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :question
end
