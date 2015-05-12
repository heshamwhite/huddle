class EventcommentsController < ApplicationController
  before_action :set_eventcomment, :isadmin?, only: [:show, :edit, :update, :destroy]

  # GET /eventcomments
  # GET /eventcomments.json
  def index
     if isadmin?
    @eventcomments = Eventcomment.all
    else
       redirect_to :controller =>'welcome', :action=> 'index'

     end
  end

  # GET /eventcomments/1
  # GET /eventcomments/1.json
  def show
  end

  # GET /eventcomments/new
  def new
    @eventcomment = Eventcomment.new
  end

  # GET /eventcomments/1/edit
  def edit
  end

  # POST /eventcomments
  # POST /eventcomments.json
  def create
    @eventcomment = Eventcomment.new(eventcomment_params)

    respond_to do |format|
      if @eventcomment.save
        format.html { redirect_to @eventcomment, notice: 'Eventcomment was successfully created.' }
        format.json { render :show, status: :created, location: @eventcomment }
      else
        format.html { render :new }
        format.json { render json: @eventcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventcomments/1
  # PATCH/PUT /eventcomments/1.json
  def update
     if isadmin?
    respond_to do |format|
      if @eventcomment.update(eventcomment_params)
        format.html { redirect_to @eventcomment, notice: 'Eventcomment was successfully updated.' }
        format.json { render :show, status: :ok, location: @eventcomment }
      else
        format.html { render :edit }
        format.json { render json: @eventcomment.errors, status: :unprocessable_entity }
      end
    end
    else
  redirect_to :controller =>'welcome', :action=> 'index'

  end
  end

  # DELETE /eventcomments/1
  # DELETE /eventcomments/1.json
  def destroy
     if isadmin?
    @eventcomment.destroy
    respond_to do |format|
      format.html { redirect_to eventcomments_url, notice: 'Eventcomment was successfully destroyed.' }
      format.json { head :no_content }
    end
    else
  redirect_to :controller =>'welcome', :action=> 'index'

  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventcomment
      @eventcomment = Eventcomment.find(params[:id])
    end
    def isadmin?
  session[:user_usertype] ==1 
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventcomment_params
      params.require(:eventcomment).permit(:body, :user_id, :event_id)
    end
end
