class LikedHotelsController < ApplicationController
  before_action :set_liked_hotel, only: [:show, :edit, :update, :destroy]

  # GET /liked_hotels
  # GET /liked_hotels.json
  def index
    @liked_hotels = LikedHotel.all

  end

  # GET /liked_hotels/1
  # GET /liked_hotels/1.json
  def show
  end

  # GET /liked_hotels/new
  def new
    @liked_hotel = LikedHotel.new
  end

  # GET /liked_hotels/1/edit
  def edit
  end

  # POST /liked_hotels
  # POST /liked_hotels.json
  def create
    @liked_hotel = LikedHotel.new(liked_hotel_params)

    respond_to do |format|
      if @liked_hotel.save
        format.html { redirect_to @liked_hotel, notice: 'Liked hotel was successfully created.' }
        format.json { render :show, status: :created, location: @liked_hotel }
      else
        format.html { render :new }
        format.json { render json: @liked_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liked_hotels/1
  # PATCH/PUT /liked_hotels/1.json
  def update
    respond_to do |format|
      if @liked_hotel.update(liked_hotel_params)
        format.html { redirect_to @liked_hotel, notice: 'Liked hotel was successfully updated.' }
        format.json { render :show, status: :ok, location: @liked_hotel }
      else
        format.html { render :edit }
        format.json { render json: @liked_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liked_hotels/1
  # DELETE /liked_hotels/1.json
  def destroy
    @liked_hotel.destroy
    respond_to do |format|
      format.html { redirect_to liked_hotels_url, notice: 'Liked hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_liked_hotel
    @liked_hotel = LikedHotel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def liked_hotel_params
    params.require(:liked_hotel).permit(:user_id, :hotel_id)
  end
end
