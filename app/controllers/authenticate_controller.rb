class AuthenticateController < ApplicationController
  def login
    if request.post?
      if Teacher.find_by(email: params[:email])
        user = Teacher.find_by(email: params[:email])
      elsif Student.find_by(email: params[:email])
        user = Student.find_by(email: params[:email])
      elsif Parent.find_by(email: params[:email])
        user = Parent.find_by(email: params[:email])
      else
        flash[:notice] = "User name not found!"
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
