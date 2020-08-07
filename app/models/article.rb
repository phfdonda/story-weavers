class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :image

  scope :most_voted, -> { order(n_of_votes: :desc) }
  scope :most_recent, -> { order(:created_at) }

  validates :text, length: { maximum: 1000 }
end
