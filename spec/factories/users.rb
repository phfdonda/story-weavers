FactoryBot.define do
  factory :random_user, class: 'User' do
    id { 1 }
    name { Faker::Movies::StarWars.unique.character }
    email { Faker::Internet.unique.email }
  end

  factory :another_random_user, class: 'User' do
    id { 2 }
    name { Faker::Movies::StarWars.unique.character }
    email { Faker::Internet.unique.email }
  end
end
