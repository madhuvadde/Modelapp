class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def user
  	User.find(session[:user_id]) if session[:user_id]
  end

  def login
  	 unless session[:user_id]
  	 	flash[:errors] = ["you must login first"]
  	 	redirect_to new_user_path
  	 end
  	end
end
