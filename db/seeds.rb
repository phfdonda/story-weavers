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
  u.email = Faker::Internet.email
end
Category.populate 20 do |c|
  c.name = Faker::Movies::StarWars.planet
  c.priority = Random.rand(5)
end
Article.populate 30 do |a|
  n += 1
  a.author_id = n
  a.category_id = n * 2
  a.title = Faker::Movies::StarWars.character
  a.text = Faker::Movies::StarWars.quote
  n = 0 if n > 9
end
