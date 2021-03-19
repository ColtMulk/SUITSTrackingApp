require 'rails_helper'

RSpec.describe 'Verifying features', type: :feature do
  scenario 'for new user' do
    rand_num = rand(1..200).to_s
        visit new_user_session_path
        page.driver.browser.manage.window.maximize
        #testing creating new user
        click_on 'Sign up'
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Smith'
        select 'new', :from => 'Member status'
        fill_in 'Email', with: 'email' + rand_num + '@email.com'
        fill_in 'Password', with: '123456'
        fill_in 'Password confirmation', with: '123456'
        click_on 'Sign up'
        expect(page).to have_content('SUITS App')
        #testing creating new event
        click_on 'Events'
        click_on 'Add New Event'
        fill_in 'event_event_name', with: 'TestEvent' + rand_num
        fill_in 'event_location', with: 'TAMU'
        fill_in 'event_event_description', with: 'This is a TestEvent'
        fill_in 'event_passcode', with: '123456'
        check 'event_is_open'
        click_on 'Add Event'
        expect(page).to have_content('TestEvent' + rand_num)
        # #Testing logging attendance for new event
        # click_on 'View'
        # click_on 'Log Attendance'
        # fill_in 'attendance_passcode', with: '123456'
        # click_on 'Submit Attendance'
        # click_on 'Attendance'
        # expect(page).to have_content('John Smith')
        # expect(page).to have_content('TestEvent')
        sleep(3)
  end

end
