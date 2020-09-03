FactoryBot.define do
  factory :random_category, class: 'Category' do
    name { Faker::Movies::StarWars.unique.planet }

    trait :with_random_priority do
      priority { Random.rand(1..5) }
    end
  end
end
