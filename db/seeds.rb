# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../lib/populator_fix.rb'

n = 0

User.populate 10 do |u|
  u.name = Faker::Name.first_name
  u.email = Faker::Internet.emwail
end
Category.populate 10 do |c|
  c.name = Faker::Movies::StarWars.planet
  c.priority = Random.rand(5)
end
Article.populate 30 do |a|
  n += 1
  a.author_id = n
  a.category_id = n
  a.n_of_votes = 0
  a.title = Faker::Movies::StarWars.character
  a.text = Faker::Movies::StarWars.quote
  n = 0 if n > 9
  sleep(0.4)
end
Vote.populate 30 do |v|
  n += 1
  v.user_id = n
  v.article_id = n + 1
  a = Article.find(n + 1)
  a.n_of_votes += 1
  a.save
  n = 0 if n > 9
end
Vote.populate 10 do |v|
  n += 1
  v.user_id = n
  v.article_id = n + 2
  a = Article.find(n + 2)
  a.n_of_votes += 1
  a.save
end
Vote.populate 10 do |v|
  n += 1
  v.user_id = n
  v.article_id = n + 10
  a = Article.find(n + 10)
  a.n_of_votes += 1
  a.save
end
