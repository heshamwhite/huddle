class WelcomeController < ApplicationController
  def index
    @myuser = User.find(5)
    @groups = @myuser.group
  end
end
