class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    @article = Article.find_it(params[:article_id])
    @article.n_of_votes += 1
    redirect_to articles_path, notice: 'This article got your vote! Lucky one!' if @vote.save && @article.save
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    @article = Article.find_it(:article_id)
    @article.n_of_votes -= 1 && @article.save if vote&.destroy
    redirect_to articles_path, notice: 'I guess it didn\'t deserve your vote, huh?'
  end
end
