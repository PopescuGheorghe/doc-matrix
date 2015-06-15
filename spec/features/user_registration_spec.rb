require 'rails_helper'

feature 'User registraters' do
  scenario 'with valid credentials' do
    sign_up_with 'test@mail.com', 'password'
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
  scenario 'with invalid email' do
    sign_up_with 'ivalid@email', 'password'
    expect(page).to have_content("Email is invalid ")
  end
  scenario 'with blank password' do
    sign_up_with "test@mail.com", ''
    expect(page).to have_content("Password can't be blank")
  end
end