class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }, unique: true

  has_many :votes
  has_many :articles
end
