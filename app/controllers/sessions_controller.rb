class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end
  def create

    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:user_name] = user.username
      session[:user_age] = user.age
      session[:user_bio] = user.bio
      session[:user_email] = user.email
      session[:user_isconfirm] = user.isconfirm
      session[:user_usertype] = user.usertype
      session[:user_interestid] = user.interest_id
      session[:user_image] = user.avatar
      session[:latitude] = user.latitude
      session[:longitude] = user.longitude


      redirect_to "/users", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end
end
