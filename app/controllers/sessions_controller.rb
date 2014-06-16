class SessionsController < ApplicationController
  def login
  end

  def login_attempt
    authorized_user = User.find_by_username(params[:username])
    if authorized_user && authorized_user.authenticate(params[:password])
      flash[:notice] = "Welcome back #{authorized_user.full_name}"
      session[:user_id] = authorized_user.id
      redirect_to root_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color] = "Invalid"
      render "login"
    end
  end
end
