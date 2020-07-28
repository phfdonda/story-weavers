class Article < ApplicationRecord
  belongs_to :author, class: :user
end
