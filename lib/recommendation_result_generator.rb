class RecommendationResultGenerator < ApplicationController
  attr_accessor :it_planner_recommendation
  def initialize it_planner_recommendation
    @it_planner_recommendation = it_planner_recommendation
  end
  def recommendresult(userid)
    it_planner_recommendation.type(userid)
  end
end