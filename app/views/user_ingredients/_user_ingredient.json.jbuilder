json.extract! user_ingredient, :id, :user_id, :ingredient_id, :quanity, :created_at, :updated_at
json.url user_ingredient_url(user_ingredient, format: :json)
