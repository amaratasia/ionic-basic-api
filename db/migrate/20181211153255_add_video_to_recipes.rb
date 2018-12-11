class AddVideoToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :video, :string
  end
end
