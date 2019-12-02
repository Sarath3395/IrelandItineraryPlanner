class ItPlannerRecommendation <  ApplicationController
  def type(userid)
    raise NotImplementedError, 'Ask the subclass'
  end
end

class RecommendationByCollaborativeHotels < ItPlannerRecommendation
  def type(userid)
    id = userid
    user = User.find(id)
    #@user = User.find_by_id(current_user.id)
    @recommendedhotelsbycollab = Hash.new(0)
    collab = user.recommend_hotels
    collab.each do|key, value|
        @recommendedhotelsbycollab[key] = value
    end
    end
    #hotelcollaborativefilter

end

class RecommendationByTopratedHotels < ItPlannerRecommendation
  def type(userid)

    @recommendedhotelsbytop = Hash.new(0)
    hotels = Hash.new(0)
    liked = LikedHotel.group(:hotel_id).count
    sortedlike = liked.sort_by{|key,value| value}.reverse
    sortedlike.each do|res|
      hotels[Hotel.find_by_id(res[0])] = res[1]
    end
    toprated = hotels
    toprated.each do |key, value|
        exst = LikedHotel.where(hotel_id: key.id, user_id: userid)
        if(exst == [])
          @recommendedhotelsbytop[key] = value
        end
    end

    #hoteltopratedfilter
  end
end

class RecommendationByCollaborativeRestaurants < ItPlannerRecommendation
  def type(userid)

    @user = User.find_by_id(userid)
    @recommendedrestaurantsbycollab = Hash.new(0)
    collab = @user.recommend_restaurants
    collab.each do|key, value|

        @recommendedrestaurantsbycollab[key] = value

    end
  end
end

class RecommendationByTopratedRestaurants < ItPlannerRecommendation
  def type(userid)
    @recommendedrestaurantsbytop = Hash.new(0)
    restaurants = Hash.new(0)
    liked = LikedRestaurant.group(:restaurant_id).count
    sortedlike = liked.sort_by{|key,value| value}.reverse
    sortedlike.each do|res|
      restaurants[Restaurant.find_by_id(res[0])] = res[1]
    end
    toprated = restaurants
    i=0
    toprated.each do |key, value|



        exst = LikedRestaurant.where(restaurant_id: key.id, user_id: userid)
        if(exst == [])
          @recommendedrestaurantsbytop[key] = value


      end
    end
  end
end

class RecommendationByCollaborativeTransports < ItPlannerRecommendation
  def type(userid)
    user = User.find_by_id(userid)
    @recommendedtrasnportsbycollab = Hash.new(0)
    collab = user.recommend_transports
    collab.each do|key, value|

        @recommendedtrasnportsbycollab[key] = value
    end
  end
end

class RecommendationByTopratedTransports < ItPlannerRecommendation
  def type(userid)
    @recommendedtrasnportsbytop = Hash.new(0)
    transports = Hash.new(0)
    liked = LikedTransport.group(:transport_id).count
    sortedlike = liked.sort_by{|key,value| value}.reverse
    sortedlike.each do|res|
      transports[Transport.find_by_id(res[0])] = res[1]
    end
    toprated = transports
    i=0
    toprated.each do |key, value|

      if (i <6)
        exst = LikedTransport.where(transport_id: key.id, user_id: userid)
        if(exst == [])
          @recommendedtrasnportsbytop[key] = value
          i=i+1
        end

      end
    end
  end
end