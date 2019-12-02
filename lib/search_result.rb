require 'bookingscrapper'

class SearchResult <ApplicationController
  def type(finalurl)
    raise NotImplementedError, 'Ask the subclass'
  end
end

class SearchbyPlace < SearchResult

  def type(finalurl)
    puts "innnnnnnnnnnnnnnnnnnnn"

    fromdatestr = params[:search][:fromdate]
    puts fromdatestr
  end
end

class SearchbyPrice < SearchResult
  def type()
    #hoteltopratedfilter
  end
end
