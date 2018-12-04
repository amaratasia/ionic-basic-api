Rails.application.routes.draw do
  resources :past_histories, only: [:index, :create]
  resources :recipes
  resources :users do
  	post "login", on: :collection
  end
  resources :user_ingredients do
  	post "cook_recipe", on: :collection
  end
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
