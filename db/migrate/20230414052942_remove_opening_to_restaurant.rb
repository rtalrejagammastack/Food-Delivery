class RemoveOpeningToRestaurant < ActiveRecord::Migration[6.1]
  def up
    remove_column :restaurants, :opening_time, :integer
    remove_column :restaurants, :closing_time, :integer
    remove_column :restaurants, :admin_user_id, :integer
  end

  def down
    add_column :restaurants, :opening_time, :integer
    add_column :restaurants, :closing_time, :integer
    add_column :restaurants, :admin_user_id, :integer
  end
end
