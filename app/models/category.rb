class Category < ApplicationRecord
  has_many :articles, dependant: :destroy
  has_many :articles_ord_by_recent, -> { order(created_at: :desc) }, class_name: 'Article'

  scope :by_priority, -> { order(priority: :desc) }
end
