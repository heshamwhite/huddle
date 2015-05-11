class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  before_action :set_user,:isadmin?, only: [:show, :edit, :update, :destroy]



  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if isadmin?

    @users = User.all
     else
       redirect_to :controller =>'welcome', :action=> 'index'

     end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @usermessage = Usermessage.new
    @a=[]
       
    interestsuser = Interests_User.where(user_id: @user.interest_id)
   
    interestsuser.each do|c|
    @interest=Interest.find_by( id: c.interest_id)
      @a.push(@interest.interestname)
        logger.debug @a

    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    # @user.interest_id=@user.id

    @user = User.new(user_params)

   
    respond_to do |format|
      if @user.save
<<<<<<< HEAD
        UserMailer.welcome_email(@user).deliver_later

        @user.update(interest_id: @user.id)
=======
        #@user.update(interest_id: @user.id)
>>>>>>> 566f33511dc09246a2965b7b93a29a9028430043
        @user.interest.split(',').each do|c| 
          if c.to_s.strip.length != 0
        @interest=Interest.find_or_create_by(interestname: c)
        # @interest=Interest.new(interestname: c)
        # @interest.save

        @interest_users= Interests_User.new(user_id:@user.id, interest_id:@interest.id)   
        @interest_users.save
        end
         end 
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if isadmin?

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  else
  redirect_to :controller =>'welcome', :action=> 'index'

  end
  end
  def confirm
            @myconfirm = Confirm.where(user_id: @user.id)

<<<<<<< HEAD
          # @myurlconfirm = Confirm.find(params[:mystring])
if @myconfirm.confirmtext == params[:mystring]
        @user.update(isconfirm: 1)
      end
=======
  def profilepage
    #render plain:session.inspect
    @user = User.find(session[:user_id])
    @groups = GroupsUser.where(user_id: @user.id)
    @a=[]

    interestsuser = Interests_User.where(user_id: @user.id)
    interestsuser.each do|c|
      @interest=Interest.find_by( id: c.interest_id)
      @a.push(@interest.interestname)
      logger.debug @a
    end
    @usermesssages = Usermessage.where(user_id: @user.id)

  end

  def editprofile
    @user = User.find(session[:user_id])
    @a=[]

    interestsuser = Interests_User.where(user_id: @user.id)
    interestsuser.each do|c|
      @interest=Interest.find_by( id: c.interest_id)
      @a.push(@interest.interestname)
      logger.debug @a
    end

  end
  def updateprofile
    @user = User.find(session[:user_id])

    editprofiledata = updateprofile_params
    @myinterest = editprofiledata[:interest]
    editprofiledata.delete(:interest_id)

    if editprofiledata[:passowrd] == ""
      editprofiledata.delete(:password)
      editprofiledata.delete(:password_confirmation)
    end
    @myinterest.split(',').each do|c|
      if c.to_s.strip.length != 0
        @interest=Interest.find_or_create_by(interestname: c)
        # @interest=Interest.new(interestname: c)
        # @interest.save

        @interest_users= Interests_User.find_or_create_by(user_id:@user.id, interest_id:@interest.id)
        #@interest_users.save
      end
    end
    render :controller => 'users', :action => 'profilepage'
>>>>>>> 566f33511dc09246a2965b7b93a29a9028430043
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if isadmin?

    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  else
      redirect_to  :controller =>'welcome', :action=> 'index', :notice => "Acess Denyed!"

  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
def isadmin?
  session[:user_usertype] ==1 
end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :hashedpassword, :password, :interest, :age, :bio, :email, :latitude, :longitude, :isconfirm, :usertype, :interest_id, :avatar)
    end

    def updateprofile_params
      params.require(:user).permit(:username, :hashedpassword, :password, :interest, :age, :bio, :email, :latitude, :longitude, :interest_id, :avatar)
    end
end
