Rails.application.routes.draw do
  resources :taggings
  resources :tags, expect: :show
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
