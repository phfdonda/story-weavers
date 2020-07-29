class Category < ApplicationRecord
  has_many :articles, foreign_key: true, dependent: :destroy
  has_many :articles_ord_by_recent, -> { order(created_at: :desc) }, class_name: 'Article'

  scope :by_priority, -> { order(priority: :desc) }
  scope :top_four, -> { limit(4) }
  scope :top_ten, -> { limit(10) }
  scope :most_recent, -> { order(created_at: :desc) }
end
