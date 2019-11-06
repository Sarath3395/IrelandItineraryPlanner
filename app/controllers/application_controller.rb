
class ApplicationController < ActionController::Base


  before_action :set_locations

  def set_locations
    @locations = Location.all
  end

end
