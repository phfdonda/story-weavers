class Category < ApplicationRecord
  validates :name, uniqueness: true

  has_many :articles, foreign_key: 'category_id', dependent: :destroy
  has_many :recent_articles, -> { order(created_at: :desc) }, class_name: 'Article'

  scope :by_priority, -> { order(:priority) }

  def article?
    return false unless articles.first

    true
  end
end
