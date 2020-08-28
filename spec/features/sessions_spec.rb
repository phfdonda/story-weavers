require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  context ': When trying to login and logout' do
    let!(:user) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article, author_id: user.id, category_id: category.id) }

    it ': the user should successfully login' do
      login_user(user)
      expect(page).to have_content('Welcome, dear writer!')
    end

    it ': the user cannot login if name is not in db' do
      visit login_path
      within('form') do
        fill_in 'Name', with: 'Completely Unnaceptable Name'
      end
      click_button 'Log In'
      expect(page).to have_content('What kind of name is that?')
    end

    it ': user should not be able to login if name is blank' do
      visit login_path
      within('form') do
        fill_in 'Name', with: '  '
      end
      click_button 'Log In'
      expect(page).to have_content('Don\'t you have a name, dear?')
    end

    it ': user should be able to logout' do
      login_user(user)
      logout_user
      expect(page).to have_content('Buh-bye! Safe travels!')
    end
  end
end
