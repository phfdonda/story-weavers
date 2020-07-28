FactoryBot.define do
  factory :random_user, class: 'User' do
    sequence(:id) { |n| n }
    name { Faker::Movies::StarWars.character }
    email { Faker::Internet.email }
  end
end
