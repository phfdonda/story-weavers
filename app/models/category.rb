class Category < ApplicationRecord
  has_many :articles, dependent: :destroy
  validates_associated :articles
  has_many :articles_ord_by_recent, -> { order(created_at: :desc) }, class_name: 'Article'

  scope :by_priority, -> { order(priority: :desc) }

  validate :priority, if: :in_range_of_priority?, on: %i[create update]

  def in_range_of_priority?
    [1, 2, 3, 4, 5].include?(:priority)
  end
end
