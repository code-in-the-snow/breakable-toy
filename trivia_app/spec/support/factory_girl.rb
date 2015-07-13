require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :question do
    body "Test Question"
    answer "coconut"
    option_a "apple"
    option_b "banana"
    option_c "coconut"
    option_d "date"
  end

end
