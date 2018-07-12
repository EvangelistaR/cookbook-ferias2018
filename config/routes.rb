Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :recipes
  resources :cuisines
  resources :recipe_types

  get '/buscar', to: 'recipes#search'
end
