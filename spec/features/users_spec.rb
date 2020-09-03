require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  context 'User does not exist' do
    let!(:user) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article, author_id: user.id, category_id: category.id) }

    it 'should successfully create an user account' do
      visit login_path
      click_link 'Register'
      within('form') do
        fill_in 'Name', with: 'Beautiful Name'
        fill_in 'Email', with: Faker::Internet.email
      end
      click_button 'Sign Up'
      expect(page).to have_content('Yay! You are one of us now! A big welcome!!!')
    end
  end
end
