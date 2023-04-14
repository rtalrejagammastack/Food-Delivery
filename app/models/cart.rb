class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :foods, through: :cart_items
  # has_one :order

  def subtotal
    cart_items.map{|item| item.quantity * item.food.price }.sum
  end
  
  def total
    subtotal + 5.0
  end
end
