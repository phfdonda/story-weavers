class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    set_variables
  end

  def show
    @all_category_articles = Category.find_it(params[:id]).articles.all.most_recent
  end

  def update_priority(new_level)
    raise 'Priority can be only from 1 to 5.' unless (1..5).include?(new_level)

    set_category
    @category.priority = new_level
    if @category.save
      redirect_to root_path, notice: 'Priority updated'
    else
      redirect_to root_path, alert: 'Problem saving in database'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def set_category
    raise 'There are no categories created yet.' if Category.all.empty?

    @category = Category.find_it(params[:id])
  end

  def set_variables
    @top_categories = Category.includes(:articles).by_priority
    @featured = @top_categories.first
    @featured_article = Article.includes(:category).most_voted.first
    @last_articles_list = Article.last_articles.paginate(page: params[:page], per_page: 8)
  end
end
