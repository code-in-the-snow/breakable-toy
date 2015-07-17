class UserQuestion < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :correct?, presence: true
end
