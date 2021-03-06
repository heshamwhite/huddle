class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?, :isadmin?
   before_action :require_login

   # def admintype
   #  if isadmin?

   #  end
   # end
 
  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to  ('/log_in')
    end
  end
#    before_action :acess_deny

 def isadmin?
	session[:user_usertype] ==1 && current_user != nil

end

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



     def logged_in?
       current_user != nil
     end

end
