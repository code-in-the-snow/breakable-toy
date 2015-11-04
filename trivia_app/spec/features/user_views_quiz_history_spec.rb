require 'rails_helper'

feature 'user views quiz history', '''
  As a signed in user
  I want to see my quiz history
  So that I can see if my scores are improving
''' do

# Acceptance Criteria
# [ ] I must be logged in
# [ ] I can see a a table of past quizzes

    let(:user) { FactoryGirl.create(:user) }
    before(:all) do
      5.times do
        FactoryGirl.create(:user_question)
      end
    end

  scenario 'user has answered 5 questions' do

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("#{user.handle}")
    expect(page).to have_content("Past Quizzes")

  end

#   scenario 'user has answered 7 questions' do
#     user = FactoryGirl.create(:user)
#
#     visit user_path
#
#     expect(page).to have_content('Question 1')
#     expect(page).to have_content('Question 1')
#     expect(page).to have_content('Question 1')
#     expect(page).to have_content('Question 1')
  end
