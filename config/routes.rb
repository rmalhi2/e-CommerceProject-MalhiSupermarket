Rails.application.routes.draw do
  get 'about/index'
  get 'categories/index'
  get 'categories/show'
  get 'products/index'
  get 'products/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'about#index'
  get 'about', to: 'about#index'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show, :index]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
