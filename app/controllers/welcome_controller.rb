class WelcomeController < ApplicationController
  def index
  	@user = if logged_in?
  		User.find session[:user_id]
  	else
  		nil
  	end
  end
end
