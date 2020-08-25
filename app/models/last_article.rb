class LastArticle < ActiveRecord::Base
  belongs_to :article
  belongs_to :category

  self.primary_key = :id

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end

  def readonly?
    true
  end
end
