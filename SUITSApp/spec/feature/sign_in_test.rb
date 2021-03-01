require 'rails_helper'

  RSpec.describe 'Verifying user sign in page', type: :feature do
      scenario 'for new user' do
        visit new_user_session_path
        expect(page).to have_content('Log in')
      end
    end
