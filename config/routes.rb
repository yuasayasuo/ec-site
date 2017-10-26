Rails.application.routes.draw do

  devise_for :users
  resources :taggings
  resources :tags, expect: :show
  resources :books
  resources :products, only: [:index, :show, :update]
  resources :orders, only: [:new, :create, :show] do
    collection do
      post :confirm
    end
  end
  resources :deliveries, only: [:index, :edit, :update]
  resources :carts, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
