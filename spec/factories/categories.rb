FactoryBot.define do
  factory :random_category, class: 'Article' do
    name { Faker::Movies::StarWars.planet }

    trait :priority_1 do
      priority { 1 }
    end

    trait :priority_2 do
      priority { 2 }
    end

    trait :with_random_priority do
      priority { Random.rand(1..5) }
    end
  end
end
