class CreateNewArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :new_articles do |t|
      t.string :title
      t.references :category, index: true, foreign_key: true
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
