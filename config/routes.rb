Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :stores
  devise_for :users
  resources :contact, only: [:index, :new, :create]
  get '/contact/index'
  post '/contact/index'
  get 'shoes/index'
  post 'shoes/index'
  get 'shoes/search'
  post 'shoes/search'
  get 'shoes/checkout'
  post 'shoes/checkout'
  get 'shoes/purchase_complete'
  post 'shoes/purchase_complete'
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'
  post 'admin/logout'
  root 'shoes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
