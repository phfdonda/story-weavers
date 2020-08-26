class Article < ApplicationRecord
  include ImageUploader[:image]

  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy

  scope :by_vote, -> { order(n_of_votes: :desc) }
  scope :most_recent, -> { order(id: :desc) }

  validates :text, length: { maximum: 5000 }

  def self.most_voted
    by_vote.first if any?
  end
end
