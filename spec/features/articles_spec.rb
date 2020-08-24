require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  context 'Users exist' do
    let!(:quote) { Faker::Movies::StarWars.quote }
    let!(:user) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article) }

    it 'should be able to create an article' do
      login_user(user)
      visit new_article_path
      within('form') do
        fill_in 'Title', with: Faker::Movies::StarWars.character
        fill_in 'Text', with: quote
        select Category.last.name, from: 'Category'
      end
      click_button 'Submit your Article!'
      expect(page).to have_content('Let the world be amazed! Your article was published!')
    end
  end
end
