Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"

  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show"

  resources :users do
    resources :posts
  end

  resources :posts

  # resources :posts, only: [:show, :index]

  # Defines the root path route ("/")
  # root "posts#index"
end
