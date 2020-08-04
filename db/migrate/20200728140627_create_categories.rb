class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, unique: true, null: false
      t.integer :priority, inclusion: { in: 1..5 }, default: 5
      t.string :last_title
      t.integer :last_article_id
      t.timestamps
    end
  end
end
