 class UsersController < ApplicationController

	before_action :auth_user, only: [:index] 
	
	def index 
		@users = User.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id DESC")
	end
	
	def new 
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:username, :password))
		if @user.save
			flash[:notice] = "注册成功，请登录"
			redirect_to new_session_path
		else
			render action: :new
		end
	end

	def blogs 
		@blogs = current_user.blogs.page(params[:page] || 1).per_page(params[:per_page] || 10).order("id DESC")
	end
end