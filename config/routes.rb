Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :main_categories, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :photos
end
