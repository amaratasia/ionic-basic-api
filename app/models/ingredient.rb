class Ingredient < ApplicationRecord

	def parent_name
		Ingredient.find(parent_id).name unless parent_id.nil?
	end
end
