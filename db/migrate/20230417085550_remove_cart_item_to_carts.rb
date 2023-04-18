class RemoveCartItemToCarts < ActiveRecord::Migration[6.1]
  def up
    add_column :carts, :cart_item_id, :integer
  end
  
  def down
    remove_column :carts, :cart_item_id, :integer
  end
  
end
