class PostsController < ApplicationController
	def index
		@post = Post.all
	end

	def new
		@posts=Post.new
	end

	def create
		post=Post.new(post_params)
		if post.save
			redirect_to posts_path
		else
			flash[:errors]=post.errors.full_messages
			redirect_to new_post_path
		end
end

 def destroy
  	dpost=Post.find(params[:id])
  	dpost.destroy
  	redirect_to posts_path
  end 

	private
	def post_params
		params.require(:post).permit(:name,:attachment)
	end
end
