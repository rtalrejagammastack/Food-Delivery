class AddAddressToRestaurant < ActiveRecord::Migration[6.1]
  def change 
    add_column :restaurants, :address, :string
    add_column :restaurants, :phone, :integer #By default SQL String limit 255 character 
    #Ex:- :limit => 40
  end
end
