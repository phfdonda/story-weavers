require 'rails_helper'

RSpec.describe 'Article' do
  context 'Creating new article' do
    let!(:user) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article) }
    let(:long_text) { 'X' * 501 }

    it 'should create an article' do
      expect(article.id).to eql(1)
    end

    it 'should refuse the creation of a article longer than 500 char' do
      article.text = long_text
      article.valid?
      expect(article.errors.messages[:text]).to eql(['500 characters in article is the maximum allowed.'])
    end

    it 'should refuse the creation of a article with a user that doesn\'t exist' do
      article.author_id = 666
      article.valid?
      expect(article.errors.messages[:author_id]).to eql(['must exist'])
    end

    it 'should refuse the creation of a article with a category that doesn\'t exist' do
      article.category_id = 666
      article.valid?
      expect(article.errors.messages[:category_id]).to eql(['must exist'])
    end
  end
end
