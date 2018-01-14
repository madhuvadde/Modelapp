Rails.application.routes.draw do
 
    root "home#index"
    resources :home
	#root "users#new"
	resources :users do
		member do
			get :confirm_email
		end
	end
	resources :sessions
	resources :posts
 #get "/users/new" => "users#new"
  
end
