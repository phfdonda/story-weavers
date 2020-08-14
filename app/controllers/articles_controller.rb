class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def show
    @article = Article.find_it(params[:id])
  end

  def index
    @category = Category.find_it(params[:id])
    @articles = @category.recent_articles unless @category.nil?
    @article_pairs = []
    @articles.each_slice(2) { |a| @article_pairs << a }
  end

  def create
    @article = current_user.articles.new(article_params)
    @article.category_name = Category.find_it(article_params[:category_id]).name

    if @article.save
      redirect_to root_path, notice: 'Let the world be amazed! Your article was published!'
    else
      redirect_to root_path, alert: 'Another great post lost to the Internet limbo'
    end
  end

  private

  def article_params
    params.require(:article).permit(:author_id, :title, :text, :category_id, :image)
  end
end
