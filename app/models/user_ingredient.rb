class UserIngredient < ApplicationRecord
  belongs_to :ingredient

  after_save :remover

  def ingredient_name
  	ingredient.name
  end
  def ingredient_parent_name
  	ingredient.parent_name
  end
	def ingredient_parent_id
  	ingredient.parent_id
  end

  def remover
    if quanity < 1
      delete
    end
  end
end
