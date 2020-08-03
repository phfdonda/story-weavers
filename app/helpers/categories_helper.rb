module CategoriesHelper
  def categories_rows(rows)
    rows.each do |row|
      row.each do |category|
        recent_article = category.articles_ord_by_recent.first.title if category.article?
        render partial: 'category_box', locals: { category: category, recent_article: recent_article }
      end
    end
  end
end
