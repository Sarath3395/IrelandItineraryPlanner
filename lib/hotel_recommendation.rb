class HotelRecommendation
  def type(userid)
    raise NotImplementedError, 'Ask the subclass'
  end
end

class RecommendationByCollab < HotelRecommendation
  def type(userid)
    userid
    #hotelcollaborativefilter
  end
end

class RecommendationByMostLiked < HotelRecommendation
  def type(userid)
    #hoteltopratedfilter
  end
end