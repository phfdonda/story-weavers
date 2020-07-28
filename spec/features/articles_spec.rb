require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  context 'Users exist' do
    # let(:quote) { Faker::Movies::StarWars.quote }
    let(:users_list) { create_list(:random_user, 10) }
    let(:categories_list) { create_list(:random_category, :with_random_priority, 10) }
    let(:articles_list) { create_list(:random_article, 10) }

    it 'should be able to create a article' do
      user = create(:random_user)
      login_user(user)
      visit 'articles'
      within('form') do
        fill_in 'Add New article', with: quote
      end
      click_button 'Save'
      expect(page).to have_content('article was successfully created.')
    end

    it 'should show all articles created by user and her friends' do
      users_list
      friendship_list
      articles_list
      user = users_list.first
      login_user(user)
      visit root_path
      expect(page).to have_css('.article', count: 6)
    end
  end
end
