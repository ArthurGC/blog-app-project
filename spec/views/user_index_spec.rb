require 'rails_helper'

RSpec.describe 'Blog App', type: :system do
  describe 'index page' do
    it 'new_user_session_path shows the right content' do
      visit new_user_session_path
      sleep(2)
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end

    it 'new_user_session_path show a detailed error' do
        visit new_user_session_path
        click_button 'Log in'
        sleep(2)
        expect(page).to have_content('Invalid Email or password.')
      end
  end
end
