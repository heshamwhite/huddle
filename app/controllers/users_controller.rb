 

class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  before_action :set_user,:isadmin?, only: [:show, :edit, :update, :destroy]



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
        UserMailer.welcome_email(@user).deliver_later

        @user.update(interest_id: @user.id)
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

          # @myurlconfirm = Confirm.find(params[:mystring])
if @myconfirm.confirmtext == params[:mystring]
        @user.update(isconfirm: 1)
      end
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
end
