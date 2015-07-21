require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:password_confirmation) { |n| "password#{n}" }
    handle "fluffy"
  end

  factory :question do
    body "Test Question"
    answer "coconut"
    options [ "apple", "banana", "date" ]
  end

  factory :question_grader do
    sequence(:response) { |n| "#{n}" }
    answer "1"
  end


end
