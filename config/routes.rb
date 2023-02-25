Rails.application.routes.draw do
  root to: "home#index"
  resources :products, only: :index

  resource :cart, only: [:show] do
    member do
      post 'add_to_cart'
      delete 'empty_cart'
    end
  end
  
  resources :carts, except: [:show] do
    member do
      delete :remove_from_cart
      post :add_quantity
      post :reduce_quantity
    end
  end

  resources :categories, onty: :show
  resources :orders, only: [:new, :index, :create]

  resources :products, only: [:index, :show]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
