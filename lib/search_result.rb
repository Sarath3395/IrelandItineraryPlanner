require 'bookingscrapper'

class SearchResult <ApplicationController
  def type(finalurl)
    raise NotImplementedError, 'Ask the subclass'
  end
end

class SearchbyPlace < SearchResult

  def type(finalurl)
    puts "innnnnnnnnnnnnnnnnnnnn"
    result = BookingScrapper.scrape(finalurl)



    #puts @scrappedHotels
    @scrappedHotels = []
    result.each_with_index do |val, index|

      if( val["rank"] == nil)
        val["rank"] = "NA"
      end
      if(val["roomtype"] ==nil)
        val["roomtype"] = "NA"
      end
      if(val["price"] ==nil)
        val["price"]= "SOLD OUT"
      else
        temp= val["price"]
        val["price"]= "Price: € #{temp}"
      end
      if(val["bedtype"]==nil)
        val["bedtype"] = "NA"
      end

      #val.store("location_id", Location.find_by_scrapper_id(location_scrapperid).id)
      puts"sssssssssssssssssssssssssssssssssssss"
     # puts val["location_id"]
      @scrappedHotels << val

      #puts "#{val} => #{index}"
    end

    puts @scrappedHotels
    #hotelcollaborativefilter
  end
end

class SearchbyPrice < SearchResult
  def type()
    #hoteltopratedfilter
  end
end
