class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :n_of_votes, default: 0
      t.references :category, index: true, foreign_key: true
      t.string :category_name
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
