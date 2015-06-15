require 'rails_helper'

feature 'User signs in' do
  scenario 'with valid credentials shows success message' do
    sign_in
    expect(page).to have_content("Signed in successfully.")
  end
  scenario 'with invalid email or password' do
    visit new_user_session_path
    click_button 'Log in'
    expect(page).to have_content("Invalid email or password.")
  end
end