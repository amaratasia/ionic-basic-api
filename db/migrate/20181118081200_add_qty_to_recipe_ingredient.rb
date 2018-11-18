class AddQtyToRecipeIngredient < ActiveRecord::Migration[5.1]
  def change
    add_column :recipe_ingredients, :qty, :integer, default: 1
  end
end
