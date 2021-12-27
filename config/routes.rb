Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :main_categories, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :photos
  get 'informations', to: "pages#informations", as: 'informations'

  get 'categories/:id/swiper_show', to: 'categories#show_swiper', as: 'show_swiper'
end
