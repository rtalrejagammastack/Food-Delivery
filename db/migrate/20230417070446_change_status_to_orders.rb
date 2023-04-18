class ChangeStatusToOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :status, :integer, :default => 0
    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
