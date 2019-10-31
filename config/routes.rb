Rails.application.routes.draw do
  resources :liked_locations
  resources :liked_transports
  resources :liked_restaurants
  resources :transports
  resources :restaurants
  resources :liked_hotels
  resources :hotels
  resources :locations
  get '/search' => 'search#searchbylocation'
  post '/search' => 'search#searchbylocation'

  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}

  root 'welcome#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
