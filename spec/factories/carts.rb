FactoryBot.define do
  factory :cart do
    association :user

    trait :with_items do
      transient do
        cart_items_count { 5 }
      end

      after(:create) do |cart, evaluator|
        create_list(:cart_item, evaluator.cart_items_count, cart: cart)
      end
    end
  end
end
