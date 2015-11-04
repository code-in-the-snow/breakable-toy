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
    FactoryGirl.create(:question)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    click_link 'Start New Quiz'

    expect(page).to have_content('Question 1')
  end
end
