class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe
      t.references :ingredient
    end
  end
end
