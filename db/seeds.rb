# Ingredient.all.delete_all
parent_categories = ["SPICES", "VEGGIES", "Meat", "Fruits"]

parent_categories.each do |ingre|
	Ingredient.create(name: ingre.titleize)
end

child_category = {"SPICES" => ["Cardamom", "Cloves", "Cassia bark", "Black pepper", "Cumin seeds", "Coriander", "Nutmeg and mace", " Mustard seeds", "Fenugreek", "Turmeric powder", "Saffron"],"VEGGIES" =>[ "artichoke", "aubergine ", "amrud", "asparagus", "legumes", "alfalfa sprouts", "azuki beans ", "bean sprouts", "black beans", "black-eyed peas", "borlotti bean", "broad beans", "chickpeas", "green beans", "kidney beans", "lentils", "lima beans or Butter bean", "mung beans", "navy beans", "pinto beans", "runner beans", "split peas", "soy beans", "peas", "mangetout or snap peas", "broccoflower ", "broccoli ", "brussels sprouts", "cabbage", "kohlrabi", "cauliflower", "celery", "endive", "fiddleheads", "frisee", "fennel", "greens", "beet greens ", "bok choy", "chard", "collard greens", "kale", "mustard greens", "spinach", "quinoa", "herbs and spices", "anise", "basil", "caraway", "cilantro ", "chamomile", "dill", "fennel", "lavender", "lemon Grass", "marjoram", "oregano", "parsley", "rosemary", "sage", "thyme", "lettuce", "arugula", "mushrooms ", "nettles", "New Zealand spinach", "okra", "onions", "Chives", "Garlic", "Leek", "onion", "shallot", "scallion ", "parsley", "peppers ", "ell pepper", "hili pepper", "Jalapeño", "Habanero", "Paprika", "Tabasco pepper", "Cayenne pepper", "radicchio", "rhubarb", "root vegetables", "beetroot ", "mangel-wurzel", "carrot", "celeriac", "daikon", "ginger", "parsnip", "rutabaga", "turnip", "radish", "wasabi", "horseradish", "white radish", "salsify ", "skirret", "sweetcorn ", "topinambur", "squashes ", "acorn squash", "bitter melon", "butternut squash", "banana squash", "courgette ", "cucumber ", "delicata", "gem squash", "hubbard squash", "marrow ", "patty pans", "pumpkin", "spaghetti squash", "tat soi", "Tomato", "tubers", "jicama", "jerusalem artichoke", "potato", "quandong", "sunchokes", "sweet potato", "taro", "yam", "water chestnut", "watercress", "Green chilies" ], "Meat" => ["Chicken", "Lamb", "Prawns", "Fish", "Rabbit", "Egg"],"Fruits" => ["Mango", "Banana", "Amla", "Muskmelon", "Papaya", "Grapes", "Pears", "Pomegranate", "Mulberry", "Orange", "Watermelon", "Sweet Lime", "Pineapple", "Black Plum", "Peach", "Guava", "Fig", "Apple"]}
child_category.each do |parent, child|
	parent = Ingredient.find_by_name(parent.titleize)
	next if parent.blank?
	child.map(&:strip).map(&:titleize).sort.each do |c|
		Ingredient.create(name: c.titleize, parent_id: parent.id)
	end
end

user = User.find_or_create_by(email: "harika.adivanne@gmail.com", password: "harika@ionic")

# Recipe.all.delete_all
lamb = Recipe.create(name: "LAMB CURRY".titleize, ingredient_list: "<li>Place water, meat, garlic, tomatoes, ginger, onions and all spices except garam masala in a pan. Mix together. </li><li>Bring to the boil until onions and tomatoes have softened and most of the water has evaporated. </li><li>Reduce heat and place lid on pan. Cook for 40- 45 minutes, stirring occasionally and adding small amounts of water if necessary. Stir in oil, add garam masala and green chilies. </li><li>Cook on high heat and stir for further 3 minutes. Add fresh tomatoes and fresh coriander.</li>")

ingres = Ingredient.where(name: ["lamb", "cloves", "garlic ", "ginger  ", "tomatoes ", "ONION", "red chili powder", "cumin seeds ", "coriander powder ", "turmeric powder", "salt ", "green chilies"].map(&:strip).map(&:titleize))
#Assign Ingredients to Lamb Curry
ingres.each do |ingre|
	lamb.recipe_ingredients << RecipeIngredient.new(ingredient_id: ingre.id)
	user.user_ingredients << UserIngredient.new(ingredient_id: ingre.id, quanity: rand(1..10))
end

lamb = Recipe.create(name: "CHICKEN CURRY".titleize, ingredient_list: "<li>Place water, meat, garlic, tomatoes, ginger, onions and all spices in a pan. Mix together. </li><li>Bring to the boil until onions and tomatoes have softened and most of the water has evaporated. </li><li>Reduce heat and place lid on pan. Cook for 40- 45 minutes, stirring occasionally and adding small amounts of water if necessary. Stir in oil, add green chilies. </li><li>Cook on high heat and stir for further 3 minutes. Add fresh tomatoes and fresh coriander.</li>")

ingres = Ingredient.where(name: ["Chicken", "cloves ", "garlic ", "ginger  ", "tomatoes ", "ONION", "red chili powder ", "cumin seeds ", "coriander powder ", "turmeric powder", "salt ", "green chilies"].map(&:strip).map(&:titleize))
#Assign Ingredients to reciepe
ingres.each do |ingre|
	lamb.recipe_ingredients << RecipeIngredient.new(ingredient_id: ingre.id)
	user.user_ingredients << UserIngredient.new(ingredient_id: ingre.id, quanity: rand(1..10))
end

lamb = Recipe.create(name: "FISH CURRY".titleize, ingredient_list: "<li>Place water, meat, garlic, tomatoes, ginger, onions and all spices except garam masala in a pan. Mix together. </li><li>Bring to the boil until onions and tomatoes have softened and most of the water has evaporated. </li><li>Reduce heat and place lid on pan. Cook for 40- 45 minutes, stirring occasionally and adding small amounts of water if necessary. Stir in oil, add garam masala and green chilies. </li><li>Cook on high heat and stir for further 3 minutes. Add fresh tomatoes and fresh coriander.</li>")

ingres = Ingredient.where(name: ["FISH", "cloves ", "garlic ", "ginger  ", "tomatoes ", "ONION", "red chili powder ", "cumin seeds ", "coriander powder ", "turmeric powder", "salt ", "green chilies"].map(&:strip).map(&:titleize))
#Assign Ingredients to reciepe
ingres.each do |ingre|
	lamb.recipe_ingredients << RecipeIngredient.new(ingredient_id: ingre.id)
	user.user_ingredients << UserIngredient.new(ingredient_id: ingre.id, quanity: rand(1..10))
end


lamb = Recipe.create(name: "Tomato CURRY".titleize, ingredient_list: "<li>Place water, Tomato, garlic, tomatoes, ginger, onions and all spices except garam masala in a pan. Mix together. </li><li>Bring to the boil until onions and tomatoes have softened and most of the water has evaporated. </li><li>Reduce heat and place lid on pan. Cook for 20- 25 minutes, stirring occasionally and adding small amounts of water if necessary. Stir in oil, add garam masala and green chilies. </li><li>Cook on high heat and stir for further 3 minutes.</li>")

ingres = Ingredient.where(name: ["Tomato", "cloves ", "garlic ", "ginger  ", "tomatoes ", "ONION", "red chili powder ", "cumin seeds ", "coriander powder ", "turmeric powder", "salt ", "green chilies"].map(&:strip).map(&:titleize))

#Assign Ingredients to reciepe

ingres.each do |ingre|
	lamb.recipe_ingredients << RecipeIngredient.new(ingredient_id: ingre.id)
	user.user_ingredients << UserIngredient.new(ingredient_id: ingre.id, quanity: rand(1..10))
end


lamb = Recipe.create(name: "Vegetable Curry".titleize, ingredient_list: "<li>Place water, tomatos,potato,onion, garlic, tomatoes and all spices except garam masala in a pan. Mix together. </li><li>Bring to the boil until onions and tomatoes have softened and most of the water has evaporated. </li><li>Reduce heat and place lid on pan. Cook for 40- 45 minutes, stirring occasionally and adding small amounts of water if necessary. Stir in oil, add garam masala and green chilies. </li><li>Cook on high heat and stir for further 3 minutes. Add fresh tomatoes and fresh coriander.</li>")

ingres = Ingredient.where(name: ['Tomato', 'Potato', 'cloves ', 'garlic ', 'ginger  ', 'tomatoes ', 'ONION', 'red chili powder ', 'cumin seeds ', 'coriander powder ', 'turmeric powder', 'salt ', 'green chilies' ].map(&:strip).map(&:titleize))

#Assign Ingredients to reciepe


ingres.each do |ingre|
	lamb.recipe_ingredients << RecipeIngredient.new(ingredient_id: ingre.id)
	user.user_ingredients << UserIngredient.new(ingredient_id: ingre.id, quanity: rand(1..10))
end
