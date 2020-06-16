require 'rails_helper'
RSpec.describe 'Event', type: :feature do
  let(:user) { User.create(name: 'John', email: 'john@example.com') }

  before(:each) do
    visit login_path
    fill_in 'session_name', with: user.name
    fill_in 'session_email', with: user.email
    click_button 'Log in'
  end

  scenario 'show all events' do
    visit events_path
    expect(page).to have_content('Upcoming Events')
  end

  scenario 'creating valid events' do
    visit new_event_path
    fill_in 'event_title', with: 'Practice'
    fill_in 'event_location', with: 'Town'
    fill_in 'event_event_date', with: Date.new
    click_button 'Create Event'
    expect(page).to have_content('event was successfully created.')
  end

  scenario 'selecting attendees' do
    visit new_event_path
    fill_in 'event_title', with: 'Practice'
    fill_in 'event_location', with: 'Town'
    fill_in 'event_event_date', with: Date.new
    click_button 'Create Event'
    visit event_path(1)
    click_checkbox = 'John'
    click_button 'Update Event'
    expect(page).to have_content('Event was successfully updated.')
  end
end
