Rails.application.routes.draw do
  # root to: "pages#home"
  root to: "pages#home_2"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :main_categories, only: [:show]
  resources :categories, only: [:show]
  resources :photos
end
