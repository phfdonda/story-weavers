class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def show
    @article = Article.find_it(params[:id])
  end

  def index
    @category = Category.find_it(params[:id])
    @articles = @category.includes(:articles).articles_ord_by_recent unless @category.empty?
  end

  def create
    @article = current_user.articles.new(article_params)

    if new_article(@article) && @article.save
      redirect_to root_path, notice: 'Let the world be amazed! Your article was published!'
    else
      redirect_to root_path, alert: 'Another great post lost to the Internet limbo'
    end
  end

  private

  def new_article(article)
    a = article
    c = Category.find_it(article.category_id)
    return true if c.update(last_title: a.title)

    false
  end

  def article_params
    params.require(:article).permit(:author_id, :title, :text, :category_id)
  end
end
