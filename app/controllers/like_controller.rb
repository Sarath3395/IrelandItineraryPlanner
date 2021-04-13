require 'favorites'

#devops01 branch indi

include Favorites
class LikeController < ApplicationController
  before_action :authenticate_user!

  def index

    @user = current_user.id

    if (params[:restaurant_id] != nil)
      @restaurant = Restaurant.find(params[:restaurant_id])
      restaurantid = @restaurant.id
      liked = LikedRestaurant.where(user_id: @user, restaurant_id: @restaurant.id)
      @tablename = LikedRestaurant
      if(liked == [])
        addtofavorite("user_id",@user,"restaurant_id", restaurantid, @tablename)
      else
        removefavotire(liked.ids, @tablename)
      end
      #restaurantlikehandler
    elsif(params[:hotel_id] != nil)

      @hotel = Hotel.find(params[:hotel_id])
      hotelid = @hotel.id
      liked = LikedHotel.where(user_id: @user, hotel_id: @hotel.id)
      @tablename = LikedHotel
      if(liked == [])
        addtofavorite("user_id",@user,"hotel_id", hotelid, @tablename)
      else
        removefavotire(liked.ids, @tablename)
      end

      #hotellikehandler
    elsif(params[:transport_id] != nil)
      @transport = Transport.find(params[:transport_id])
      transportid = @transport.id
      liked = LikedTransport.where(user_id: @user, transport_id: @transport.id)
      @tablename = LikedTransport
      if(liked == [])
        addtofavorite("user_id",@user,"transport_id", transportid, @tablename)
      else
        removefavotire(liked.ids, @tablename)
      end

      #transportlikehandler
    end
    @hotels = Hotel.all
    @liked_hotels = LikedHotel.where(user_id: current_user.id)
    @restaurants = Restaurant.all
    @liked_restaurants = LikedRestaurant.where(user_id: current_user.id)
    @transport = Transport.all
    @liked_transports = LikedTransport.where(user_id: current_user.id)


  end


end
