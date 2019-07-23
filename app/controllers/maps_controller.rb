class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    gon.users = Map.all
    @maps = Map.all
    @map_first = Map.first
    @map = Map.new
    @maps_unname = Map.where("address LIKE ?", "%名称未設定%") 
  end

  def admin
    gon.users = Map.all
    @maps = Map.all
    @map_first = Map.first
    @map = Map.new
  end

  def dev
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    @maps = Map.all
  end

  # GET /maps/new
  def new 
    @map = Map.new
    respond_to do |format| 
      format.html{ redirect_to @map, notice: 'map was successfully created.' }
      format.js {} 
    end
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
  end

  def bye
    @maps = Map.all
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to root_path, notice: 'Map was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:address, :latitude, :longitude)
    end
end
