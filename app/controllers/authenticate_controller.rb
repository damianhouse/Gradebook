class AuthenticateController < ApplicationController
  def login
    if request.post?
      unless params[:user_type].nil?
        user = params[:user_type].constantize
      else
        flash[:notice] = "Incorrect user name and password"
      end

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        # user.find_by(email: params[:email])
        redirect_to assignments_path
        flash[:notice] = "You successfully logged in!"
      else
        flash[:notice] = "Wrong password. Please try again."
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect to authenticate_login_path, notice: "You successfully logged out!"
  end

  private
    def authenticate
    	if session[:user_id].nil?
    		redirect_to authenticate_login_path, notice: "You must login in order to proceed."
    	end
    end
end
