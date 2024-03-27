Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  # get 'about/index'
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'home#index'
  get '/about', to: 'about_pages#show'
  get '/contact', to: 'contact_pages#show'

  # post '/add_to_cart', to: 'cart#add_to_cart'
  get '/view_cart', to: 'cart#view_cart'
  delete '/remove_from_cart/:id', to: 'cart#remove_from_cart', as: 'remove_from_cart'
  post '/add_to_cart', to: 'cart#add_to_cart', as: 'add_to_cart'
  patch '/update_cart/:id', to: 'cart#update_cart', as: 'update_cart'



  get 'about', to: 'about#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show, :index]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
