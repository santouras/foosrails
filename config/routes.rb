Foosrails::Application.routes.draw do
  resources :users
  resources :games
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup', to: 'users#new', via: [:get, :post]
  match '/signin', to: 'sessions#new', via: [:get, :post]
  match '/signout', to: 'sessions#destroy', via: :delete
end
