require 'rails_helper'

RSpec.describe 'authenticate a user', type: :feature do
  let(:user) { User.create(name: 'Faith', email: 'faith@example.com') }

  scenario 'login user' do
    visit login_path
    fill_in 'session_name', with: user.name
    fill_in 'session_email', with: user.email
    click_button 'Log in'
    expect(page).to have_content("Welcome #{user.name}")
  end
  scenario 'sign up a user' do
    visit new_user_path
    fill_in 'user_name', with: 'George'
    fill_in 'user_email', with: 'george@example.com'
    click_button 'Sign Up'
    expect(page).to have_content('Log in')
  end

  scenario 'logout a user' do
    visit login_path
    fill_in 'session_email', with: user.email
    fill_in 'session_name', with: user.name
    click_button 'Log in'
    click_on 'Log Out'
    expect(page).to have_content('Email')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Log in')
  end
end
