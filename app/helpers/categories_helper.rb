module CategoriesHelper
  def categories_rows
    @top_categories.each do |c|
      render partial: category_box, category: c
    end
  end

end
