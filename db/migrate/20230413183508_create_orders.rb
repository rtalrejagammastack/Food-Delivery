class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.float :total
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.float :total_amount
      t.references :order_items, foreign_key: true

      t.timestamps
    end
  end
end
