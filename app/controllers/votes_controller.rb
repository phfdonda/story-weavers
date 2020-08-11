class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    @article = Article.find_it(params[:article_id])
    @article.n_of_votes += 1
    redirect_to root_path, notice: "'#{@article.title}' got your vote! Lucky one!" if @vote.save && @article.save
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, article_id: params[:id])
    @article = Article.find_it(params[:id])
    if vote&.destroy
      unvote_phrase = "I guess '#{@article.title}' didn't deserve your vote, huh?"
      @article.n_of_votes -= 1
      @article.save
      redirect_to "/category/show/#{@article.category_id}", notice: unvote_phrase
    else
      redirect to root_path, alert: 'What? You tried to unvote? How rude!'
    end
  end
end
