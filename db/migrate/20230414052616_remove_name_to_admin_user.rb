class RemoveNameToAdminUser < ActiveRecord::Migration[6.1]
  def up
    remove_column :admin_users, :name, :string
  end

  def down
    add_column :admin_users, :name, :string
  end
  
end
