FactoryBot.define do
  factory :random_article, class: 'Article' do
    title { Faker::Movies::StarWars.character }
    text { Faker::Movies::StarWars.quote(character: title) }
    sequence(:author_id) { |n| n }

    trait :cat1 do
      category_id { 1 }
    end

    trait :cat2 do
      category_id { 2 }
    end

    trait :cat_rand do
      sequence(:category_id) { |n| n }
    end
  end
end
