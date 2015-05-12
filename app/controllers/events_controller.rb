class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.where("group_id = ?", params[:group_id])
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  def memberjoin
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])

    @message = ""
    if params[:intent] == "join"
      unless @event.users.include?(@user)
        @user.events << @event
        @message = "joined the event"
      else
        @message = "already a member"
      end
    elsif params[:intent] == "leave"
      if @event.users.include?(@user)
        @event.users.delete(@user)
        @message = "left the event"
      else
        @message = "only members can leave"
      end

    end
    render json: {result: @message}
  end

  def membership
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
    @found = @event.users.include?(@user)
    render json: {result: @found}

  end

  # GET /events/new
  def new
    @event = Event.new
    @group = params[:group]
    @group_obj = Group.find(params[:group])
    if ( @group_obj.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end

  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create



    @group = Group.find(event_params[:group_id])


    if ( @group.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end

    @user = User.find(session[:user_id])
    @ismember = @group.user.include?(@user)

    if @ismember
      @event = Event.new(event_params)

      respond_to do |format|
        if @event.save
          @group = Group.find(event_params[:group_id])
          @users = @group.user

          @users.each do |currentuser|
            data = Hash.new
            data[:body] = "New Event in Group " + @group.name
            data[:url] = "/events/" + @event.id.to_s
            data[:notificationtype] = "newevent"
            data[:user_id] = currentuser.id
            notification = Notification.create(data)
            notification.save
          end

          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      render plain:"Unauthorized operation"
    end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

    @group = @event.group

    if ( @group.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end


    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy

    @group = @event.group

    if ( @group.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end


    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :lat, :log, :desc, :date, :group_id)
    end
end
