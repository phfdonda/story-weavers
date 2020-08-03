class NewArticle < ApplicationRecord
  belongs_to :category
  has_one_attached :avatar
end
