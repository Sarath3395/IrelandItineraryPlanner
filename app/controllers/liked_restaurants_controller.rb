class LikedRestaurantsController < ApplicationController
  before_action :set_liked_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /liked_restaurants
  # GET /liked_restaurants.json
  def index
    @liked_restaurants = LikedRestaurant.all
  end

  # GET /liked_restaurants/1
  # GET /liked_restaurants/1.json
  def show
  end

  # GET /liked_restaurants/new
  def new
    @liked_restaurant = LikedRestaurant.new
  end

  # GET /liked_restaurants/1/edit
  def edit
  end

  # POST /liked_restaurants
  # POST /liked_restaurants.json
  def create
    @liked_restaurant = LikedRestaurant.new(liked_restaurant_params)

    respond_to do |format|
      if @liked_restaurant.save
        format.html { redirect_to @liked_restaurant, notice: 'Liked restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @liked_restaurant }
      else
        format.html { render :new }
        format.json { render json: @liked_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liked_restaurants/1
  # PATCH/PUT /liked_restaurants/1.json
  def update
    respond_to do |format|
      if @liked_restaurant.update(liked_restaurant_params)
        format.html { redirect_to @liked_restaurant, notice: 'Liked restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @liked_restaurant }
      else
        format.html { render :edit }
        format.json { render json: @liked_restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liked_restaurants/1
  # DELETE /liked_restaurants/1.json
  def destroy
    @liked_restaurant.destroy
    respond_to do |format|
      format.html { redirect_to liked_restaurants_url, notice: 'Liked restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liked_restaurant
      @liked_restaurant = LikedRestaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liked_restaurant_params
      params.require(:liked_restaurant).permit(:user_id, :restaurant_id)
    end
end
