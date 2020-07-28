class Vote < ApplicationRecord
  has_one :user, foreign_key: true
  has_one :article, foreign_key: true
end
