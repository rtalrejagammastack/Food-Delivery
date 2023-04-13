# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?



# 20230330124304_change_foods_to_menu_item.rb
# 20230330134156_change_menu_item_to_foods.rb
# 20230331062449_add_attachment_to_foods.rb
# 20230403101821_add_restaurant_id_to_foods.rb
# 20230404072906_remove_restaurant_id_to_foods.rb

# 20230404073356_remove_categories_id_to_foods.rb   !!   category id not present


# 20230405132440_remove_customer_to_orders.rb    !!  order not present
# remove_column :orders, :customer_name
# remove_column :orders, :customer_address
# remove_column :orders, :customer_phone

# 20230406101512_remove_oredr_id_to_order_items.rb
# remove_column :order_items, :order_id


# 20230407065614_add_order_id_to_order_items.rb   ! check
# add_column :order_items, :order_id, :integer

# There must be reference in up and down both