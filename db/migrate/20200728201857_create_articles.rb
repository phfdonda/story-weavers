class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.references :category, foreign_key: true
      t.references :author, class_name: 'User', foreign_key: true
      t.timestamps
    end
  end
end
