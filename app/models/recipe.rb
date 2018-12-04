class Recipe < ApplicationRecord
	has_many :recipe_ingredients

	def complete_cooking(user_id)
		recipe_ingre = recipe_ingredients.map{|x| { x.ingredient_id => x.qty}}.inject(:merge)
		user_ingre = User.find(user_id).user_ingredients.where(ingredient_id: recipe_ingre.keys)
		user_ingre.each do |ingre|
			ingre.quanity = ingre.quanity.to_i - recipe_ingre[ingre.ingredient_id].to_i
			ingre.save
		end
		PastHistory.create(user_id: user_id, recipe: self)
	end
end
