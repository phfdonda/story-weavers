# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_805_210_607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'text'
    t.integer 'n_of_votes', default: 0
    t.bigint 'category_id'
    t.string 'category_name'
    t.bigint 'author_id'
    t.json 'image_data'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['author_id'], name: 'index_articles_on_author_id'
    t.index ['category_id'], name: 'index_articles_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'priority', default: 5
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'votes', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'article_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['article_id'], name: 'index_votes_on_article_id'
    t.index ['user_id'], name: 'index_votes_on_user_id'
  end

  add_foreign_key 'articles', 'categories'
  add_foreign_key 'articles', 'users', column: 'author_id'
  add_foreign_key 'votes', 'articles'
  add_foreign_key 'votes', 'users'

  create_view 'last_articles', materialized: true, sql_definition: <<-SQL
      SELECT la.id,
      la.title,
      la.image_data,
      c.id AS category_id,
      c.name AS category_name
     FROM (categories c
       JOIN ( SELECT articles.id,
              articles.title,
              articles.category_id,
              articles.image_data
             FROM articles
            WHERE (articles.id IN ( SELECT max(articles_1.id) OVER (PARTITION BY articles_1.category_id) AS max
                     FROM articles articles_1
                    ORDER BY articles_1.id DESC))) la ON ((c.id = la.category_id)))
    ORDER BY c.priority;
  SQL
end
