class Category < ApplicationRecord
  has_many :articles, dependant: :destroy
end
