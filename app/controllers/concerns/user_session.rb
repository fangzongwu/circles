module Concerns 
	module UserSession 

		def self.included base 
			base.class_eval do 
				helper_method :logged_in?
				helper_method :current_user
			end
		end

		# 登录
		def signin_user user 
			session[:user_id] = user.id
		end

		# 退出登录
		def logout_user 
			session[:user_id] = nil
		end

		# 判断是否登录
		def logged_in? 
      		!!session[:user_id] #这里使用！！来返回一个布尔值 !nil == true => !!nil == false；
		end

		# 当前用户
		def current_user 
			if logged_in? 
      			@current_user ||= User.find(session[:user_id]) #等同于：@current_user = @current_user || User.find(session[:user_id])
      		else
      			nil
			end
		end

	end
end