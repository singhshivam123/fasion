# frozen_string_literal: true

Rails.application.routes.draw do
  resources :offers
  devise_for :users
  resources :users, only: %i[show edit update]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'pincodes/set_pincode', to: 'pincodes#set_pincode', as: :set_pincode
  get 'pincodes/set_country', to: 'pincodes#set_country', as: :set_country
  get 'pincodes/set_state', to: 'pincodes#set_state', as: :set_state
  get 'pincodes/set_city', to: 'pincodes#set_city', as: :set_city
  get 'test', to: 'pincodes#test', as: :test
  post 'test_create', to: 'pincodes#test_create', as: :test_create

  get 'orders/:id/confirm', to: 'orders#confirm', as: :confirm
  resources :orders
  get '/checkouts', to: 'orders#checkouts', as: :checkouts

  resources :carts, except: %i[new show]
  resources :products, only: %i[index show], param: :slug

  resources :home, only: :create
  get '/contact', to: 'home#contact', as: :contact
  root 'home#index'
end
