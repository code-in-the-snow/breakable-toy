class Question < ActiveRecord::Base
  validates :body, presence: true
  validates :answer, presence: true
  validates :option_a, presence: true
  validates :option_b, presence: true
  validates :option_c, presence: true
  validates :option_d, presence: true
end
