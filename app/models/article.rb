class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :avatar

  scope :most_voted, -> { order(:vote) }
  scope :top_four, -> { limit(4) }
  scope :top_ten, -> { limit(10) }

  validates :text, length: { maximum: 1000 }
end
