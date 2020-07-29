FactoryBot.define do
  factory :random_article, class: 'Article' do
    title { Faker::Movies::StarWars.character }
    text { Faker::Movies::StarWars.quote }
    sequence(:category_id) { |n| n }
    sequence(:author_id) { |n| n }

    trait :cat2 do
      category_id { 2 }
    end
  end
end
