Rails.application.routes.draw do
  resources :report_errors
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
  post '/adminpage' => 'admin#adminhome'


  get 'like' => 'like#index'
  post 'like' => 'like#index'
  get 'toprated' => 'toprated#index'
  post 'toprated' => 'toprated#index'


  get 'new_report_error_path' => 'report_errors#new'




  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks"} do


  end

  root 'welcome#homepage'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
