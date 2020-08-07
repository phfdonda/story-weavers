class Category < ApplicationRecord
  has_many :articles, foreign_key: 'category_id', dependent: :destroy
  has_many :recent_articles, -> { order(created_at: :desc) }, class_name: 'Article'
  has_one :last_article, -> { order(created_at: :desc).limit(1) }, foreign_key: 'category_id', class_name: 'Article'
  has_one_attached :image

  scope :by_priority, -> { order(:priority) }

  def article?
    return false unless articles.first

    true
  end

  def self.last_articles
    select('id, name').where(id: LastArticle.select('category_id')).order(:priority)
  end

  def self.categories_list
    categories_list = []
    Category.all.each do |c|
      categories_list << c
    end
    categories_list
  end
end
