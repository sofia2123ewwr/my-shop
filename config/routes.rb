Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  root to: "home#index"

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'cart_products/:id/add' => "cart_products#add_quantity", as: "cart_product_add"
  post 'cart_products/:id/reduce' => "cart_products#reduce_quantity", as: "cart_product_reduce"

  post 'cart_product' => "cart_products#create"
  get 'cart_product/:id' => "cart_products#show", as: "cart_products"
  delete 'cart_product/:id' => "cart_products#destroy"

  get '/products', to: 'products#index'
  get '/categories', to: 'caregories#show'
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
