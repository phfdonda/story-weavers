class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    set_variables
  end

  private

  def set_variables
    @featured_article = Article.most_voted
    @last_articles_list = LastArticle.all.paginate(page: params[:page], per_page: 8)
  end
end
