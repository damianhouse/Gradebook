class AuthenticateController < ApplicationController
  def login
    if request.post?
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        User.find_by(email: params[:email])
        flash[:notice] = “Whatever you want it to flash at this point”
  end

  def logout
    session[:user_id] = nil
    redirect to authenticate_login_path, notice: “Whatevs”
  end
end
