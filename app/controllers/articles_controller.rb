class ArticlesController < ApplicationController
  def index
    @article = Article.new
  end

  def create
    if logged_in?
      @article = current_user.articles.new(article_params)

      redirect_to articles_path, notice: 'Let the world be amazed! Your article was published!' if @article.save
    else
      redirect_to login_path, alert: 'You must be logged in to create an article'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
