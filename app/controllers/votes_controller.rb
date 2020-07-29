class VotesController < ApplicationController
  # before_action :authenticate_user!

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    redirect_to articles_path, notice: 'This article got your vote! Lucky one!' if @vote.save
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    vote&.destroy
    redirect_to articles_path, notice: 'I guess it didn\'t deserve your vote, huh?'
  end
end
