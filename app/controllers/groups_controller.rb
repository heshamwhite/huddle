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
    @a=[]

    groupsinterest= GroupsInterest.where(group_id: @group.id)

    groupsinterest.each do|c|
      @interest=Interest.find_by( id: c.interest_id)
      @a.push(@interest.interestname)
      logger.debug @a
    end
  end

  def searchnearest
    # 10 is the distance in kilometers , should be passed in get
    # origin is the lat and lng , will be retrieved from user session info
    @distance = params[:distance]
    currentlat = params[:search_lat]
    currentlng = params[:search_lng]
    #render plain: "OK"+@distance.to_s
    @groups = Group.within( @distance, :origin => [currentlat	,currentlng])
  end

  def members
    @group = Group.find(params[:id])
    @users = @group.user
  end

  def searchstr
    # probably accessed by
    # str should be passed in get
    @searchstr = params[:searchstr]
    str = @searchstr
    str.strip!
    str.downcase!
    str_modified = "%" + str + "%"
    @groups_str_in_desc = Group.where("LOWER(groups.desc) LIKE ? ",str_modified)
    interestObj = Interest.where("LOWER(interests.interestname) LIKE ? ",str_modified)
    @groups_str_in_interest = interestObj.group
    #@groups_str_in_desc = Group.find_by_sql("select * from groups where groups.desc LIKE '%art%';")
    @groups = @groups_str_in_desc + @groups_str_in_interest
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
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

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
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
      params.require(:group).permit(:name, :lat, :log, :desc, :membertitle, :user_id, :interest)
    end

end
