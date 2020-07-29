class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @category = Category.new
    # @top_categories = Category.all.by_priority
    # @featured_category = @top_categories.first
    # @featured_article = @featured_category.most_voted.first
  end

  def show
    set_variables
  end

  def update_priority(new_level)
    raise 'Priority can be only from 1 to 10.' unless (1..10).include?(new_level)

    set_category
    @category.priority = new_level
    if @category.save
      redirect_to root_path, notice: 'Priority updated'
    else
      redirect_to root_path, alert: 'Problem saving in database'
    end
  end

  private

  def set_category
    @category = Category.find_it(params[:id])
  end

  def set_variables
    set_category
    @recent_articles = @category.articles_ord_by_recent
    @last_article = @recent_articles.first
    @last_four_articles = @recent_articles.top_four
  end
end
