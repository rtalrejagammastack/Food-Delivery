class AddUserToOrderItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :user, foreign_key: true
  end
end
