RSpec.describe 'Vote' do
  context 'Trying to vote' do
    let(:author) { create(:random_user) }
    let(:voter) { create(:random_user) }
    let(:category) { create(:random_category) }
    let(:article) { create(:random_article) }

    it 'shouldn\'t give a vote when there is no article' do
      author
      voter
      vote = Vote.new(user_id: voter.id)
      expect(vote.valid?).to eql(false)
    end

    it 'shouldn\'t give a vote when there is no voter' do
      author
      category
      article
      author.destroy
      vote = Vote.new(article_id: article.id)
      expect(vote.valid?).to eql(false)
    end

    it 'should be able to vote' do
      author
      voter
      category
      article
      vote = Vote.create(article_id: article.id, user_id: voter.id)
      expect(vote.valid?).to eql(true)
    end
  end
end
