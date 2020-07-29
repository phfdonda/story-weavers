class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.references :category, index: true, foreign_key: true
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
