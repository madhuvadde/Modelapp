Rails.application.routes.draw do
 
  get 'developers/index'

    root "home#index"
    resources :home
	resources :users
	resources :sessions
	resources :posts
 #get "/users/new" => "users#new"
  
end
