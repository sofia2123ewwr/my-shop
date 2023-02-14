Rails.application.routes.draw do
  root to: "home#index"
  resources :products, only: :index

  post 'cart_products/:id/add' => "cart_products#add_quantity", as: "cart_product_add"
  post 'cart_products/:id/reduce' => "cart_products#reduce_quantity", as: "cart_product_reduce"
  delete "cart_products/:id" => "cart_products#destroy", as: "cart_product_destroy"

  resources :cart_products
  resources :carts
  resources :categories, onty: :show
  resources :orders, only: [:new, :index, :create]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
