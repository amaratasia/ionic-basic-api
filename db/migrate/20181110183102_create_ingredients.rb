class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    add_index :ingredients, :parent_id
  end
end
