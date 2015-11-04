require 'rails_helper'
require 'byebug'

feature 'user views quiz history', '''
  As a signed in user
  I want to see my quiz history
  So that I can see if my scores are improving
''' do

# Acceptance Criteria
# [ ] I must be logged in
# [ ] I can see a a table of past quizzes

    let(:user) { FactoryGirl.create(:user) }


    scenario 'user has one quiz' do

      user_q1 = FactoryGirl.create(:user_question, user_id: user.id)
      user_q2 = FactoryGirl.create(:user_question, user_id: user.id)
      user_q3 = FactoryGirl.create(:user_question, user_id: user.id)
      user_q4 = FactoryGirl.create(:user_question, user_id: user.id, correct?: false)
      user_q5 = FactoryGirl.create(:user_question, user_id: user.id, correct?: false)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      save_and_open_page

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
#  end
end
