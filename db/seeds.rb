# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../lib/populator_fix.rb'

User.populate 10 do |u|
  u.name = Faker::Name.first_name
  u.email = Faker::Internet.email
end

categories = Category.create([
                               { name: 'Dracula', priority: 3 },
                               { name: 'Alice in Wonderland', priority: 2 },
                               { name: 'Metamorphosis', priority: 5 },
                               { name: 'Pride and Prejudice', priority: 4 },
                               { name: 'Sherlock Holmes', priority: 0 },
                               { name: 'War and Peace', priority: 4 },
                               { name: 'Dr. Jekyl and Mr. Hyde', priority: 3 },
                               { name: "Grimm's Fairy Tales", priority: 1 },
                               { name: 'Frankenstein', priority: 5 }
                             ])
categories.each do |category|
  category.articles.create(
    title: Faker::Movies::StarWars.character,
    text: Faker::Movies::StarWars.quote,
    category_name: category.name,
    author_id: Random.rand(1..9)
  )
end
