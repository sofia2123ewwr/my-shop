Rails.application.routes.draw do
  resources :products
  resources :categories

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "home#index"
  get '/product', to: 'product#index'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
