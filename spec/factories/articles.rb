FactoryBot.define do
  factory :random_article, class: 'Article' do
    title { Faker::Movies::StarWars.character }
    text { Faker::Movies::StarWars.quote }
    category_id { 1 }
    author_id { 1 }
  end
end
