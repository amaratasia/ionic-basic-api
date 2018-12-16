class AddImageAndDetailsToIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :ingredients, :image, :string
    add_column :ingredients, :details, :string
  end
end
