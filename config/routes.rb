Rails.application.routes.draw do
  root to: "home#index"

  get 'carts/:id' => "carts#show", as: "cart"
  # delete 'carts/:id' => "carts#destroy"

  get 'cart_products/:id/add' => "cart_products#add_quantity", as: "cart_product_add"
  get 'cart_products/:id/reduce' => "cart_products#reduce_quantity", as: "cart_product_reduce"

  # post 'cart_products' => "cart_products#create"
  # delete 'cart_products/:id' => "cart_products#destroy"

  get '/products', to: 'products#index'
  get '/categories', to: 'caregories#show'

  resources :cart_products, only: [:create, :destroy]
  resources :categories
  resources :orders

  # resources :product_orders
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
