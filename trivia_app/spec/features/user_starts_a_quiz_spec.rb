require 'rails_helper'

feature 'user starts a quiz', '''
  As a signed in user
  I want to start a quiz
  So that I can test my trivia knowledge
''' do

# Acceptance Criteria
# [ ] I must be logged in
# [ ] I can select a button to start quiz

  scenario 'signed in user starts quiz' do
    user = FactoryGirl.create(:user)

    visit user_path

    click_button 'Start Quiz'

    expect(page).to have_content('Question 1')
  end
end
