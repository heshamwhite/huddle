class GrouprepliesController < ApplicationController
  before_action :set_groupreply, only: [:show, :edit, :update, :destroy]

  # GET /groupreplies
  # GET /groupreplies.json
  def index
    @groupreplies = Groupreply.where("groupmessage_id = ?", params[:groupmessage_id])
  end

  # GET /groupreplies/1
  # GET /groupreplies/1.json
  def show
  end

  # GET /groupreplies/new
  def new
    @groupreply = Groupreply.new
  end

  # GET /groupreplies/1/edit
  def edit
  end

  # POST /groupreplies
  # POST /groupreplies.json
  def create
    mygroupreplay = Hash.new
    mygroupreplay[:body] = params[:body]
    mygroupreplay[:user_id] = params[:user_id]
    mygroupreplay[:groupmessage_id] = params[:groupmessage_id]
    #render plain:  params[:body]
    @groupreply = Groupreply.new(mygroupreplay)

    respond_to do |format|
      if @groupreply.save
        format.html { redirect_to @groupreply, notice: 'Groupreply was successfully created.' }
        format.json { render :show, status: :created, location: @groupreply }
      else
        format.html { render :new }
        format.json { render json: @groupreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupreplies/1
  # PATCH/PUT /groupreplies/1.json
  def update
    respond_to do |format|
      if @groupreply.update(groupreply_params)
        format.html { redirect_to @groupreply, notice: 'Groupreply was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupreply }
      else
        format.html { render :edit }
        format.json { render json: @groupreply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupreplies/1
  # DELETE /groupreplies/1.json
  def destroy
    @groupreply.destroy
    respond_to do |format|
      format.html { redirect_to groupreplies_url, notice: 'Groupreply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupreply
      @groupreply = Groupreply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupreply_params
      params.require(:groupreply).permit(:body, :user_id, :groupmessage_id)
    end
end
