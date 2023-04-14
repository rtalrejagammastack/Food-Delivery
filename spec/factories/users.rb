FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }

    factory :user_with_cart do
      after(:create) do |user|
        create(:cart, user: user)
      end
    end
  end
end
