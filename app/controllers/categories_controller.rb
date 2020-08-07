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

  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def set_category
    raise 'There are no categories created yet.' if Category.all.empty?

    @category = Category.find_it(params[:id])
  end

  def make_rows(list)
    row = []
    rows = []
    list.each_with_index do |item, index|
      row << item
      if (index % 4).zero?
        rows << row
        row = []
      elsif index == list.size
        rows << row
      end
    end
    rows
  end

  def set_variables
    @top_categories = Category.includes(:articles).by_priority
    @featured = @top_categories.first
    @featured_article = Article.includes(:category).most_voted.first
    @categories_last_articles = LastArticle.all
    @last_articles_list = Article.all.where(id: LastArticle.ids)
    @images = ActiveStorageAttachment.all.where(record_id: LastArticle.ids)
  end
end
