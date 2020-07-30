require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  context 'User exist' do
    let!(:user) { create(:random_user) }

    it 'successfully creates a session' do
      login_user(user)
      expect(page).to have_content('Welcome, dear writer!')
    end

    it 'cannot login if name is not in db' do
      visit login_path
      within('form') do
        fill_in 'Name', with: 'Completely Unnaceptable Name'
      end
      click_button 'Log In'
      expect(page).to have_content('What kind of name is that?')
    end

    it 'cannot login if name is blank' do
      visit login_path
      within('form') do
        fill_in 'Name', with: '  '
      end
      click_button 'Log In'
      expect(page).to have_content('Don\'t you have a name, dear?')
    end

    it 'successfully destroys a session' do
      login_user(user)
      logout_user(user)
      expect(page).to have_content('Buh-bye! Safe travels!')
    end
  end
end
