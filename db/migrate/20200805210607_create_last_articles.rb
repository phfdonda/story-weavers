class CreateLastArticles < ActiveRecord::Migration[6.0]
  def change
    create_view :last_articles
  end
end
