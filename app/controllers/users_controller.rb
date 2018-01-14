class UsersController < ApplicationController
	#before_action :login
  def index
  	@users=User.all
  end

  def new
  	@user=User.new
  end

def create
  	user=User.new(user_params)
  	if user.save
      UserMailer.registration_confirmation(user).deliver
      flash[:success] = "Registraion completed! Please Confirm your Email address."
  		session[:user_id] = user.id
  		redirect_to users_path
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to new_user_path

  	end
  end

   def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user_params
      user.email_activate
      flash[:success] = "Welcome to St.Anne's School! Your account has been confirmed."
      redirect_to root_url
    end
   end

   def show
    @user = user
   end

  	 private 
	def user_params
		params.require(:user).permit(:name, :email,:password,:password_confirmation)
	end
end
