require 'rails_helper'

RSpec.feature 'Votes', type: :feature do
  context 'Articles were written and user wants to vote' do
    let!(:user) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article, author_id: user.id, category_id: category.id) }

    it 'should be able to vote' do
      test_vote
      expect(page).to have_content("'#{article.title}' got your vote! Lucky one!")
    end

    it 'should be able to unvote' do
      test_vote
      click_link 'Unvote'
      expect(page).to have_content("I guess '#{article.title}' didn't deserve your vote, huh?")
    end
  end
end
