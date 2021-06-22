Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :main_categories, only: [:show]
  resources :categories, only: [:show]
  resources :photos
end
