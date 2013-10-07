Foosrails::Application.routes.draw do
  resources :users
  resources :games
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  get '/signup', to: 'users#new', via: [:get, :post]
  get '/signin', to: 'sessions#new', via: [:get, :post]
  get '/signout', to: 'sessions#destroy', via: :delete
end
