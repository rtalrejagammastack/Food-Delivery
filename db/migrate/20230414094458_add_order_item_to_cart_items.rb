class AddOrderItemToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_items, :order_item, foreign_key: true
  end
end
