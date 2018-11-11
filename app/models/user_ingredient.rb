class UserIngredient < ApplicationRecord
  belongs_to :ingredient

  def ingredient_name
  	ingredient.name
  end
  def ingredient_parent_name
  	ingredient.parent_name
  end
	def ingredient_parent_id
  	ingredient.parent_id
  end
end
