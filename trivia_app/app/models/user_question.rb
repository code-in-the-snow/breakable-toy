require 'byebug'

class UserQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :response, presence: { allow_blank: true }
end
