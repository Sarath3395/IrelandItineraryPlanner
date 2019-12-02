class TopratedController < ApplicationController
  def index

    if( user_signed_in? )
    @hotels = Hash.new(0)
    liked = LikedHotel.group(:hotel_id).count
    sortedlike = liked.sort_by{|key,value| value}.reverse
    sortedlike.each do|res|

        exst = LikedHotel.where(hotel_id: res[0], user_id: current_user.id)
      if(exst == [])
        @hotels[Hotel.find_by_id(res[0])] = res[1]
      end

    end

    @restaurants = Hash.new(0)
    liked = LikedRestaurant.group(:restaurant_id).count
    sortedlike = liked.sort_by{|key,value| value}.reverse
    sortedlike.each do|res|

      exst = LikedRestaurant.where(restaurant_id: res[0], user_id: current_user.id)
      if(exst == [])
      @restaurants[Restaurant.find_by_id(res[0])] = res[1]
      end

    end

    @transports = Hash.new(0)
    liked = LikedTransport.group(:transport_id).count
    sortedlike = liked.sort_by{|key,value| value}.reverse
    sortedlike.each do|res|

      exst = LikedTransport.where(transport_id: res[0], user_id: current_user.id)
      if(exst == [])
      @transports[Transport.find_by_id(res[0])] = res[1]
      end

    end
    else
      @hotels = Hash.new(0)
      liked = LikedHotel.group(:hotel_id).count
      sortedlike = liked.sort_by{|key,value| value}.reverse
      sortedlike.each do|res|
        @hotels[Hotel.find_by_id(res[0])] = res[1]
      end
      @restaurants = Hash.new(0)
      liked = LikedRestaurant.group(:restaurant_id).count
      sortedlike = liked.sort_by{|key,value| value}.reverse
      sortedlike.each do|res|
        @restaurants[Restaurant.find_by_id(res[0])] = res[1]
      end
      @transports= Hash.new(0)
      liked = LikedTransport.group(:transport_id).count
      sortedlike = liked.sort_by{|key,value| value}.reverse
      sortedlike.each do|res|
        @transports[Transport.find_by_id(res[0])] = res[1]
      end


    end


    end
end

