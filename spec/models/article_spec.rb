require 'rails_helper'

RSpec.describe 'Article' do
  context 'Creating new article' do
    let!(:user) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article, author_id: user.id, category_id: category.id) }
    let(:long_text) { 'X' * 1001 }

    it 'should create an article' do
      expect(Article.all.count).to eql(1)
    end

    it 'should refuse the creation of a article longer than 1000 char' do
      article.text = long_text
      article.valid?
      expect(article.errors.messages[:text]).to eql(['is too long (maximum is 1000 characters)'])
    end

    it 'should refuse the creation of a article with a user that doesn\'t exist' do
      article.author_id = 666
      article.valid?
      expect(article.errors.messages[:author]).to eql(['must exist'])
    end

    it 'should refuse the creation of a article with a category that doesn\'t exist' do
      article.category_id = 666
      article.valid?
      expect(article.errors.messages[:category]).to eql(['must exist'])
    end
  end
end
