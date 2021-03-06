class SessionsController < ApplicationController 
	def new 

	end

	def create 
		@user = User.find_by(username: params[:username], password: params[:password])
		if @user 
			signin_user @user
			flash[:notice] = "登录成功"
			redirect_to root_path
		else
			flash[:notice] = "用户名或密码不正确"
			render(action: :new) 
		end
	end

	def destroy 
		logout_user
		flash[:notice] = "退出成功"
		redirect_to root_path
	end
end