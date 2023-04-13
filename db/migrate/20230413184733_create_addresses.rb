class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :street
      t.references :user, foreign_key: true
      t.boolean :default, default: false

      t.timestamps
    end
  end
end
