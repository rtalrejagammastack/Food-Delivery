class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :food
  has_one :order_item
  # belongs_to :order
end
