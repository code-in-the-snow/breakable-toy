require 'pry'
require 'byebug'

class UserQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :correct?, presence: true
  validates :response, presence: { allow_blank: true }
end
