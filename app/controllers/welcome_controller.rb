class WelcomeController < ApplicationController
  def index
    id = session[:user_id]
    @myuser = User.find(id)
    @groups = @myuser.group

  end
end
