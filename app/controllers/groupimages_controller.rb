class GroupimagesController < ApplicationController
  before_action :set_groupimage, only: [:show, :edit, :update, :destroy]

  # GET /groupimages
  # GET /groupimages.json
  def index
    @groupimages = Groupimage.all
  end

  # GET /groupimages/1
  # GET /groupimages/1.json
  def show
  end

  # GET /groupimages/new
  def new
    @groupimage = Groupimage.new
  end

  # GET /groupimages/1/edit
  def edit
  end

  # POST /groupimages
  # POST /groupimages.json
  def create
    @groupimage = Groupimage.new(groupimage_params)

    respond_to do |format|
      if @groupimage.save
        format.html { redirect_to @groupimage, notice: 'Groupimage was successfully created.' }
        format.json { render :show, status: :created, location: @groupimage }
      else
        format.html { render :new }
        format.json { render json: @groupimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groupimages/1
  # PATCH/PUT /groupimages/1.json
  def update
    respond_to do |format|
      if @groupimage.update(groupimage_params)
        format.html { redirect_to @groupimage, notice: 'Groupimage was successfully updated.' }
        format.json { render :show, status: :ok, location: @groupimage }
      else
        format.html { render :edit }
        format.json { render json: @groupimage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groupimages/1
  # DELETE /groupimages/1.json
  def destroy
    @groupimage.destroy
    respond_to do |format|
      format.html { redirect_to groupimages_url, notice: 'Groupimage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_groupimage
      @groupimage = Groupimage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def groupimage_params
      params.require(:groupimage).permit(:group_id, :desc)
    end
end
