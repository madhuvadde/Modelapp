Rails.application.routes.draw do
 
	root "users#new"
	resources :users
	resources :sessions
	resources :posts
 #get "/users/new" => "users#new"
 
end
