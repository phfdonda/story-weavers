class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    set_variables
  end

  def show
    set_variables
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

  def set_category
    raise 'There are no categories created yet.' if Category.all.empty?

    @category = Category.find_it(params[:id])
  end

  def set_variables
    # set_category
    @top_categories = Category.all.by_priority
    @last_article =
    @featured_category = @top_categories.first
    @featured_article = @featured_category.articles.most_voted.first
  end
end
