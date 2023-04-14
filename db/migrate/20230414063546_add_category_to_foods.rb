class AddCategoryToFoods < ActiveRecord::Migration[6.1]
  def change
    add_reference :foods, :category, foreign_key: true
  end
end
