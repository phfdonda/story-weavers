class Category < ApplicationRecord
  has_many :articles, foreign_key: 'category_id', dependent: :destroy
  has_many :articles_ord_by_recent, -> { order(created_at: :desc) }, class_name: 'Article'

  scope :by_priority, -> { order(priority: :desc) }
  scope :most_recent, -> { order(created_at: :desc) }

  def article?
    return self unless articles.first
  end
end
