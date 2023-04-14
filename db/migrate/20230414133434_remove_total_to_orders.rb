class RemoveTotalToOrders < ActiveRecord::Migration[6.1]
  def up 
    remove_column :orders, :total, :float
  end

  def down
    add_column :orders, :total, :float
  end
  
end
