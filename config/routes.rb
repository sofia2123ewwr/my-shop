Rails.application.routes.draw do
  root to: "home#index"
  resources :products, only: :index

  resources :cart_products, only: [:create, :destroy]
  resources :carts
  resources :categories, onty: :show
  resources :orders, only: [:new, :index, :create]

  resources :cart_products do
    post :add_quantity, on: :member
    post :reduce_quantity, on: :member
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
