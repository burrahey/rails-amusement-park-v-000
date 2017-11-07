Rails.application.routes.draw do
  resources :attractions
  resources :rides, only: :create
  root to: 'welcome#home'
  resources :users
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
end
