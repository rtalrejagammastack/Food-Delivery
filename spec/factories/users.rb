FactoryBot.define do
  factory :user do
    email{Faker::Internet.unique.email}
    password{Faker::Config.random = Random.new(6)}
  end
end
