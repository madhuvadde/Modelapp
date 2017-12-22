class SessionsController < ApplicationController
	  
         def create
		user=User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/users/<%= user.id %>"
		else
			flash[:errors]=["Invalid combination"]
			redirect_to new_user_path
		end
	end


def show
	@user=user

end


	def destroy
		reset session
		redirect_to new_user_path
	end
end