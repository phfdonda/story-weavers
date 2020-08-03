class NewArticlesController < ApplicationController
  before_action :authenticate_user!

  def create




    # @new_article = current_user.new_articles.new(new_article_params)
    # @old_article = New_Article.find_by_category(@new_article.category_id) if category_already_has?(@new_article)
    # @article_migration = @old_article.dup
    # @article_migration.created_at = @old_article.created_at

    # if @new_article.save && erase_old_and_send(@old_article, @article_migration)
    #   redirect_to articles_path, notice: 'Let the world be amazed! Your article was published!'
    # else
    #   redirect_to articles_path, alert: 'Another great post lost to the Internet limbo'
    # end
  end

  private

  def category_already_has?(new_article)
    return true if New_Article.find_by_category(new_article.category_id)

    false
  end

  def new_article_params
    params.require(:new_article).permit(:author_id, :title, :text, :category_id)
  end
end
