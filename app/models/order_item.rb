class OrderItem < ApplicationRecord
  
  belongs_to :food
  belongs_to :order
  belongs_to :user
  has_one :cart_item
  
end
