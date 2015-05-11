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
    @user =  usermsg_values[:receiver]
    redirect_to @user, notice: 'Message was successfully sent.'
  end

  def show
    @usermessage = Usermessage.find(params[:id])
    @sender = User.find(@usermessage.sender)
  end
  def getmymessages
    @user = User.find(session[:user_id])
    @usermessages = Usermessage.where(receiver_id: session[:user_id] )
    #format.json { render plain, status: :created, location: @user }
    #format.json { render :json => @usermessages }

    respond_to do |format|  ## Add this
      format.json {render :json => @usermessages, status: :ok}
      format.html
      ## Other format
    end                    ## Add this
  end
  private
  def usermessage_params
    params.require(:usermessage).permit(:title, :body, :receiver)
  end
end
