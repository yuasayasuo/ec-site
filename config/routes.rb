Rails.application.routes.draw do

  devise_for :users
  resources :taggings
  resources :tags, expect: :show
  resources :books
  resources :products, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
