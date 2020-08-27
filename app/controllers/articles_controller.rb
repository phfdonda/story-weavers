class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @categories = Category.all
  end

  def show
    @article = Article.find_it(params[:id])
  end

  def index
    @category = Category.find_it(params[:id])
    @articles = @category.recent_articles.paginate(page: params[:page], per_page: 8) unless @category.nil?
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.category_name = Category.find_it(article_params[:category_id]).name

    if @article.valid?
      @article.save
      redirect_to root_path, notice: 'Let the world be amazed! Your article was published!'
    else
      redirect_to root_path, alert: 'Another great post lost to the Internet limbo'
    end
    LastArticle.refresh
  end

  private

  def article_params
    params.require(:article).permit(:author_id, :title, :text, :category_id, :image)
  end
end
