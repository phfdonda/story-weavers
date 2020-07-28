class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20 }

  has_many :votes
  has_many :articles
end
