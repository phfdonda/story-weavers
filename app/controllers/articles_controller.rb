class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    redirect_to articles_path, notice: 'Let the world be amazed! Your article was published!' if @article.save
  end

  private

  def article_params
    params
    # params.require(:article).permit(:author_id, :title, :text, :category_id)
  end
end
