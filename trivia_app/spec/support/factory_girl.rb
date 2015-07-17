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

  factory :user_question do
  end


end
