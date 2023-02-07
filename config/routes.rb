Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :categories

  root to: "home#index"
  get '/products', to: 'products#index'
  get '/categories', to: 'caregories#show'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'cart_products/:id/add' => "cart_products#add_quantity", as: "cart_product_add"
  post 'cart_products/:id/reduce' => "cart_products#reduce_quantity", as: "cart_product_reduce"
  post 'cart_products' => "cart_products#create"
  get 'cart_products/:id' => "cart_products#show", as: "cart_product"
  delete 'cart_products/:id' => "cart_products#destroy"
end
