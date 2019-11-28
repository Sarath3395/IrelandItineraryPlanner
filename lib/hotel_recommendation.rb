class HotelRecommendation <  ApplicationController
  def type(userid)
    raise NotImplementedError, 'Ask the subclass'
  end
end

class RecommendationByCollab < HotelRecommendation
  def type(userid)
    userid
    puts "lllllllllllllllllllllllllllllllllllllllllllllll"
    puts "#{User.all}"
    #hotelcollaborativefilter
  end
end

class RecommendationByMostLiked < HotelRecommendation
  def type(userid)
    #hoteltopratedfilter
  end
end