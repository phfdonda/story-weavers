require 'rails_helper'

RSpec.describe 'Vote' do
  context 'Trying to vote' do
    let!(:author) { create(:random_user) }
    let!(:category) { create(:random_category) }
    let!(:article) { create(:random_article) }
    let!(:voter) { create(:another_random_user) }

    it 'shouldn\'t give a vote when there is no article' do
      vote = Vote.new(user_id: voter.id)
      expect(vote.valid?).to eql(false)
    end

    it 'shouldn\'t give a vote when there is no voter' do
      vote = Vote.new(article_id: article.id)
      expect(vote.valid?).to eql(false)
    end

    it 'should be able to vote' do
      vote = Vote.create(article_id: article.id, user_id: voter.id)
      expect(vote.valid?).to eql(true)
    end
  end
end
