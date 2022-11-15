Rails.application.routes.draw do
  devise_for :users
 
  root 'public_recipes#index'
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit] 
    resources :shopping_lists, only: [:index, :show]    
  end
  resources :foods
  resources :public_recipes, only: [:index]
end
