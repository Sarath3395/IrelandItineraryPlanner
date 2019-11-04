Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :liked_locations
  resources :liked_transports
  resources :liked_restaurants
  resources :transports
  resources :restaurants
  resources :liked_hotels
  resources :hotels
  resources :locations

  post '/search' => 'search#searchmethod'
  get '/adminpage' => 'admin#adminhome'


  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"}

  root 'welcome#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
