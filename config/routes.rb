Rails.application.routes.draw do

root 'welcome#homepage'
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
  get '/search' => 'search#searchmethod'
  post '/search' => 'search#searchmethod'

  get '/adminpage' => 'admin#adminhome'
  post '/adminpage' => 'admin#adminhome'


  get 'like' => 'like#index'
  post 'like' => 'like#index'
  get 'toprated' => 'toprated#index'
  post 'toprated' => 'toprated#index'

  get 'viewlogs' => 'report_errors#viewlogs'
  post 'viewlogs' => 'report_errors#viewlogs'


  get 'new_report_error_path' => 'report_errors#new'
 get '/searchbyprice' => 'searchbyprice#searchbyprice'
 post '/searchtransportrestaurant' => 'searchbyprice#searchtransportrestaurant'
 get '/searchtransportrestaurant' => 'searchbyprice#searchtransportrestaurant'

  post '/userpreference' => 'searchbyprice#userpreference'
 get '/userpreference' => 'searchbyprice#userpreference'







  devise_for :users, :controllers => {:omniauth_callbacks => "callbacks",registrations: 'users/registrations', sessions: "users/sessions"} do

  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
