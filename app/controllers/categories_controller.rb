class CategoriesController < ApplicationController
  def index
    # Change to order by priority
    @categories = Category.all.by_priority
  end

  def show
    @category = Category.find_it(params[:id])
    @recent_articles = @category.articles_ord_by_recent
    @last_article = @recent_articles.first
  end
end
