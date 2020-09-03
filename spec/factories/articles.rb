FactoryBot.define do
  factory :random_article, class: 'Article' do
    title { Faker::Movies::StarWars.character }
    text { Faker::Movies::StarWars.quote }
  end
end
