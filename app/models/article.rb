class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :votes, dependent: :destroy
  has_one_attached :avatar
end
