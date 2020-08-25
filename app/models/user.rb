class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, uniqueness: true

  has_many :votes, foreign_key: 'user_id'
  has_many :articles, foreign_key: 'author_id'
end
