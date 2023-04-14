FactoryBot.define do
  factory :order do
    factory :order do
      user
      status { :pending }
  
      after(:build) do |order|
        order.cart_items << FactoryBot.build(:cart_item)
      end
  
      factory :order_with_items do
        transient do
          items_count { 2 }
        end
  
        after(:build) do |order, evaluator|
          evaluator.items_count.times do
            order.cart_items << FactoryBot.build(:cart_item)
          end
        end
      end
    end
  end
 
end
