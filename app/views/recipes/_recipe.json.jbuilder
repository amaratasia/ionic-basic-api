json.extract! recipe, :id, :name, :ingredient_list, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
