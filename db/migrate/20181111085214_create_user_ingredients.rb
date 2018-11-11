class CreateUserIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ingredients do |t|
      t.integer :user_id
      t.references :ingredient, foreign_key: true
      t.integer :quanity

      t.timestamps
    end
  end
end
