class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.belongs_to :food
      t.float :price

      t.timestamps
    end
  end
end
