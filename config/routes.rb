Rails.application.routes.draw do
  resources :recipes
  resources :users do
  	post "login", on: :collection
  end
  resources :user_ingredients
  resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
