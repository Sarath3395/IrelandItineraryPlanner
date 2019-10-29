class LikedLocationsController < ApplicationController
  before_action :set_liked_location, only: [:show, :edit, :update, :destroy]

  # GET /liked_locations
  # GET /liked_locations.json
  def index
    @liked_locations = LikedLocation.all
  end

  # GET /liked_locations/1
  # GET /liked_locations/1.json
  def show
  end

  # GET /liked_locations/new
  def new
    @liked_location = LikedLocation.new
  end

  # GET /liked_locations/1/edit
  def edit
  end

  # POST /liked_locations
  # POST /liked_locations.json
  def create
    @liked_location = LikedLocation.new(liked_location_params)

    respond_to do |format|
      if @liked_location.save
        format.html { redirect_to @liked_location, notice: 'Liked location was successfully created.' }
        format.json { render :show, status: :created, location: @liked_location }
      else
        format.html { render :new }
        format.json { render json: @liked_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liked_locations/1
  # PATCH/PUT /liked_locations/1.json
  def update
    respond_to do |format|
      if @liked_location.update(liked_location_params)
        format.html { redirect_to @liked_location, notice: 'Liked location was successfully updated.' }
        format.json { render :show, status: :ok, location: @liked_location }
      else
        format.html { render :edit }
        format.json { render json: @liked_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liked_locations/1
  # DELETE /liked_locations/1.json
  def destroy
    @liked_location.destroy
    respond_to do |format|
      format.html { redirect_to liked_locations_url, notice: 'Liked location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked_location
      @liked_location = LikedLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liked_location_params
      params.require(:liked_location).permit(:user_id, :location_id)
    end
end
