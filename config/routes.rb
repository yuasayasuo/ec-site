Rails.application.routes.draw do

  get 'orders/new'

  devise_for :users
  resources :taggings
  resources :tags, expect: :show
  resources :books
  resources :products, only: [:index, :show]
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
