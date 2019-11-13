require 'favorites'

include Favorites
class LikeController < ApplicationController

  def index

    if (params[:restaurant_id] != nil)
      restaurantlikehandler
    elsif(params[:hotel_id] != nil)
      hotellikehandler
    elsif(params[:transport_id] != nil)
      transportlikehandler
    end
    @hotels = Hotel.all
    @liked_hotels = LikedHotel.where(user_id: current_user.id)
    @restaurants = Restaurant.all
    @liked_restaurants = LikedRestaurant.where(user_id: current_user.id)
    @transport = Transport.all
    @liked_transports = LikedTransport.where(user_id: current_user.id)


  end


end
