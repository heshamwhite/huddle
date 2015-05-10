class UsermessagesController < ApplicationController
  def new
    senderuserobject = User.find(session[:user_id])
    @receiver_user_id = senderuserobject.id
    @receiver_username = senderuserobject.username

    @usermessage = Usermessage.new
    @usermessage.receiver = senderuserobject
  end

  def create
    usermsg_values = usermessage_params
    usermsg_values[:seen] = 0
    usermsg_values[:sender] = User.find(session[:user_id])
    usermsg_values[:receiver] = User.find(usermsg_values[:receiver])
    @usermessage = Usermessage.new(usermsg_values)
    @usermessage.save
    render plain: "OK"
  end

  def show

  end

  private
  def usermessage_params
    params.require(:usermessage).permit(:title, :body, :receiver)
  end
end
