module CategoriesHelper
  def categories_rows
    @top_categories.each do |c|
      render partial: 'categories/category_box', locals: { category: c }
    end
  end
end
