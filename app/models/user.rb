class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :email, uniqueness: true

  has_many :votes
  has_many :articles, foreign_key: 'author_id'

  def self.return_current_user(session)
    find_by(id: session)
  end
end
