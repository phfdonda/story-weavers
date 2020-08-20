class Article < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_one :last_article
  has_many :votes, dependent: :destroy

  scope :most_voted, -> { order(n_of_votes: :desc) }
  scope :most_recent, -> { order(id: :desc) }

  validates :text, length: { maximum: 1000 }

  def self.last_articles
    includes(:category).all.where(id: LastArticle.ids)
  end

end
