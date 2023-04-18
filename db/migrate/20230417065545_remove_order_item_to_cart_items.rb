class RemoveOrderItemToCartItems < ActiveRecord::Migration[6.1]
  def up
    remove_column :cart_items, :order_item_id, :integer
  end

  def down
    add_column :cart_items, :order_item_id, foreign_key: :true
  end
  
end
