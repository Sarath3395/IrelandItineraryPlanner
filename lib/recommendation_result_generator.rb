class RecommendationResultGenerator < ApplicationController
  attr_accessor :hotel_recommendation
  def initialize hotel_recommendation
    @hotel_recommendation = hotel_recommendation
  end
  def recommendresult(userid)
     hotel_recommendation.type(userid)
  end
end