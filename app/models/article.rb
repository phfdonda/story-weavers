class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: true
  belongs_to :category, foreign_key: true
  has_many :votes, dependent: :destroy
  has_one_attached :avatar

  validates :text, length: { maximum: 500 }
end
