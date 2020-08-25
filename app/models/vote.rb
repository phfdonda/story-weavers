class Vote < ApplicationRecord
  has_one :user, foreign_key: 'user_id'
  has_one :article, foreign_key: 'article_id'

  validates :user_id, presence: true
  validates :article_id, presence: true
  validates :article_id, uniqueness: { scope: :user_id }
end
