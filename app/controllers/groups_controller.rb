class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index


    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @username_id =@group.user_id
    @organizer = User.find(@username_id)
    @a=[]


    @organizerChk = (@group.user_id.to_i == session[:user_id].to_i )? true :false ;

    groupsinterest= GroupsInterest.where(group_id: @group.id)

    groupsinterest.each do|c|
      @interest=Interest.find_by( id: c.interest_id)
      @a.push(@interest.interestname)
      logger.debug @a
    end

    @user = User.find(session[:user_id])
    @ismember = @group.user.include?(@user)

  end

  def searchnearest
    # 10 is the distance in kilometers , should be passed in get
    # origin is the lat and lng , will be retrieved from user session info

    @distance = params[:distance]
    @orig_lat = params[:search_lat]
    @orig_lon = params[:search_lng]
    # #render plain: "OK"+@distance.to_s
    # @groups = Group.within( @distance, :origin => [currentlat	,currentlng])
#    @groups = Group.find_by_sql("SELECT *, 3956 * 2 * ASIN(SQRT( POWER(SIN((@orig_lat -abs( groups.lat)) * pi()/180 / 2),2) + COS(@orig_lat * pi()/180 ) * COS( abs(groups.lat) *  pi()/180) * POWER(SIN((@orig_lon – groups.lon) *  pi()/180 / 2), 2) )) as distance FROM groups having distance < @dist ORDER BY distance;")

    # set lon1 = mylon-dist/abs(cos(radians(mylat))*69);
    # lon1 =
    #
    # set lon2 = mylon+dist/abs(cos(radians(mylat))*69);set lat1 = mylat-(dist/69);set lat2 = mylat+(dist/69);
    #
    #
    # @groups = Group.find_by_sql("SELECT groups.*,
    #   3956 * 2 * ASIN(SQRT( POWER(SIN((#{@orig_lat} - groups.lat) *  pi()/180 / 2), 2) +COS(#{@orig_lat} * pi()/180) * COS(groups.lat * pi()/180) * POWER(SIN((#{@orig_lon} -groups.lon) * pi()/180 / 2), 2) ))
    #   as distance FROM groups WHERE origin.id=userid
    #   and destination.longitude between lon1 and lon2 and destination.latitude between lat1 and lat2")

    @groups = Group.find_by_sql("
        SELECT groups.*, SQRT(
        POW(69.1 * (groups.lat - #{@orig_lat}), 2) +
        POW(69.1 * (#{ @orig_lon} - groups.log) * COS(groups.lat / 57.3), 2)) AS distance
        FROM groups HAVING distance < #{@distance} ORDER BY distance;")
    #render plain: "OK"+@groups.inspect
  end

  def members
    @group = Group.find(params[:id])
    @users = @group.user
  end

  def images
    @group = Group.find(params[:id])
    @images = @group.groupimages
  end

  def memberjoin
    @group = Group.find(params[:id])
    @user = User.find(session[:user_id])

    @message = ""
    if params[:intent] == "join"
      unless @group.user.include?(@user)
        @user.group << @group
        @message = "joined the group"
      else
        @message = "already a member"
      end
    elsif params[:intent] == "leave"
      if @group.user.include?(@user)
        @group.user.delete(@user)
        @message = "left the group"
      else
        @message = "only members can leave"
      end

    end
    render json: {result: @message}
  end

  def membership
    @group = Group.find(params[:id])
    @user = User.find(session[:user_id])
    @found = @group.user.include?(@user)
    render json: {result: @found}

  end

  def searchstr



    # probably accessed by
    # str should be passed in get
    @groups = Array.new
    @searchstr = params[:searchstr]
    str = @searchstr
    str.strip!
    str.downcase!
    str.split.each do |keyword|
      logger.debug keyword
      str_modified = "%" + keyword + "%"
      @groups_str_in_desc = Group.where("LOWER(groups.desc) LIKE ? ",str_modified)
      @interestObj = Interest.where("LOWER(interests.interestname) LIKE ? ",str_modified).first
      #render plain: @interestObj.inspect

      if @interestObj!=nil
        @groups_str_in_interest = @interestObj.groups
        if @groups_str_in_interest !=nil
          @groups =  @groups + @groups_str_in_interest
        end
      end

      if @groups_str_in_desc !=nil
        @groups =  @groups + @groups_str_in_desc
      end
    end
  end

  # GET /groups/new
  def new
    @group = Group.new

  end

  # GET /groups/1/edit
  def edit
    if ( session[:user_usertype] == 1  or  @group.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end

  end

  # POST /groups
  # POST /groups.json
  def create
    modifiedparams = group_params
    modifiedparams[:user_id] = session[:user_id]

    @group = Group.new(group_params)
    modifiedparams[:user_id] = session[:user_id]
    myintereststr = params[:interest]
    #render plain:myintereststr
    respond_to do |format|
      if @group.save
        myintereststr.split(',').each do|c|
          if c.to_s.strip.length != 0
            @interest=Interest.find_or_create_by(interestname: c)

            @group_interest= GroupsInterest.new(group_id:@group.id, interest_id:@interest.id)
            @group_interest.save
          end
        end
        format.html { redirect_to @group, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update


    if ( session[:user_usertype] == 1  or  @group.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end


    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def uploadgroupimages
    @group = Group.find(params[:id])
    params[:groupimages]['gimage'].each do |a|
      @groupimage = @group.groupimages.create!(:gimage => a, :group_id => @group.id)
    end
    redirect_to  @group
  end

  def newgroupimages
    @group = Group.find(params[:id])
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy

    if ( session[:user_usertype] == 1  or  @group.user_id.to_i == session[:user_id].to_i )
      x=1
    else
      render plain: "unauthorized access "
      return
    end

    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def group_params
      params.require(:group).permit(:name, :lat, :log, :desc, :membertitle, :user_id, :interest, :groupavatar, :bgimage)
    end

    def groupphoto_params
      #params.require(:groupimage).permit(:group_id, :gimage)
      params.require(:group).permit(:name, groupimages_attributes: [:id, :group_id, :gimage])
    end

end
