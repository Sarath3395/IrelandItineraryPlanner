class SearchResultGenerator < ApplicationController
  attr_accessor :search_result
  def initialize search_result
    @search_result = search_result
  end
  def resgen(finalurl)
    search_result.type(finalurl)
  end
end
