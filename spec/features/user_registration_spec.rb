require 'rails_helper'

feature 'User registers' do
  scenario 'with valid credentials' do
    sign_up_with 'test@mail.com', 'password'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
