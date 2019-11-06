require 'bookingscrapper'

class SearchController < ApplicationController

  def searchmethod

    searchtype = params[:search][:searchtype]

    puts '-----------------------------------'
    if(searchtype.eql? "searchbyprice")
      puts "Print inside search by price controller"
      self.searchbyprice

    elsif(searchtype.eql? "searchbyplace")
      puts "Print inside search by place controller"
      self.searchbylocation

    end

  end
  def searchbylocation

    defaultUrl = "https://www.booking.com/searchresults.en-us.html?aid=397594&label=gog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB&sid=6426bb78f6fe60bf3b783451f500e2a1&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.html%3Faid%3D397594%3Blabel%3Dgog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB%3Bsid%3D6426bb78f6fe60bf3b783451f500e2a1%3Bsb_price_type%3Dtotal%26%3B&"

    fromdatestr = params[:search][:fromdate]
    todatestr = params[:search][:todate]
    fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
    todate = Date.strptime(todatestr, '%Y-%m-%d')
    noofpersons = params[:noofpersons]
    noofrooms = params[:noofrooms]
    location_scrapperid = params[:search][:place]

    str1 = "ss=Dublin&"
    str2 = "is_ski_area=0&"
    str3 = "ssne=Dublin&"
    str4 = "ssne_untouched=Dublin&"
    str5 = "dest_id=#{location_scrapperid}&"
    str6 = "dest_type=city&"
    str7 = "checkin_year=#{fromdate.year}&"
    str8 = "checkin_month=#{fromdate.month}&"
    str9 = "checkin_monthday=#{fromdate.day}&"
    str10 = "checkout_year=#{todate.year}&"
    str11 = "checkout_month=#{todate.month}&"
    str12 = "checkout_monthday=#{todate.day}&"
    str13 = "group_adults=#{noofpersons}&"
    str14 = "group_children=0&"
    str15 = "no_rooms=#{noofrooms}&"
    str16 = "b_h4u_keep_filters=&"
    str17 = "from_sf=1"

    finalurl = defaultUrl+str1+str2+str3+str4+str5+str6+str7+str8+str9+str10+str11+str12+str13+str14+str15+str16+str17

    result = BookingScrapper.scrape(finalurl)



    #puts @scrappedHotels
    @scrappedHotels = []
    result.each_with_index do |val, index|

      if (val["roomtype"] ==nil || val["price"] ==nil)
        val["roomtype"] = "NA"
        val["price"]= "SOLD OUT"
        val["bedtype"] = "NA"
       end
      if( val["rank"] == nil)
        val["rank"] = "NA"
      end
val.store("location_id", Location.find_by_scrapper_id(location_scrapperid).id)
      puts"sssssssssssssssssssssssssssssssssssss"
      puts val["location_id"]
      @scrappedHotels << val

      #puts "#{val} => #{index}"
    end

    puts @scrappedHotels
    updatehotelstable
  end

  def searchbyprice

    defaultUrl = "https://www.booking.com/searchresults.en-us.html?aid=397594&label=gog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB&sid=6426bb78f6fe60bf3b783451f500e2a1&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.html%3Faid%3D397594%3Blabel%3Dgog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB%3Bsid%3D6426bb78f6fe60bf3b783451f500e2a1%3Bsb_price_type%3Dtotal%26%3B&"

    fromdatestr = params[:search][:fromdate]
    todatestr = params[:search][:todate]
    fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
    todate = Date.strptime(todatestr, '%Y-%m-%d')
    noofpersons = params[:noofpersons]
    noofrooms = params[:noofrooms]
    price = params[:search][:price]
    str1 = "ss=Dublin&"
    str2 = "is_ski_area=0&"
    str3 = "ssne=Dublin&"
    str4 = "ssne_untouched=Dublin&"
    str5 = "dest_id=102&"
    str6 = "dest_type=country&"
    str7 = "checkin_year=#{fromdate.year}&"
    str8 = "checkin_month=#{fromdate.month}&"
    str9 = "checkin_monthday=#{fromdate.day}&"
    str10 = "checkout_year=#{todate.year}&"
    str11 = "checkout_month=#{todate.month}&"
    str12 = "checkout_monthday=#{todate.day}&"
    str13 = "group_adults=#{noofpersons}&"
    str14 = "group_children=0&"
    str15 = "no_rooms=#{noofrooms}&"
    str16 = "nflt=pri%3D#{price}%3B&"
    str17 = "b_h4u_keep_filters=&"
    str18 = "from_sf=1"

    finalurl = defaultUrl+str1+str2+str3+str4+str5+str6+str7+str8+str9+str10+str11+str12+str13+str14+str15+str16+str17+str18

    result = BookingScrapper.scrape(finalurl)



    #puts @scrappedHotels
    @scrappedHotels = []
    result.each_with_index do |val, index|

      if (val["roomtype"] ==nil || val["price"] ==nil)
        val["roomtype"] = "NA"
        val["price"]= "SOLD OUT"
        val["bedtype"] = "NA"
      end
      if( val["rank"] == nil)
        val["rank"] = "NA"
      end
      @scrappedHotels << val

      #puts "#{val} => #{index}"
    end
    #updatehotelstable
  end

  def updatehotelstable
    #tmp = @scrappedHotels.first()
    #tmp = {"name"=>"Cheap Accommodation close to Dublin city Center and Dublin Airport", "rank"=>"8.1", "location"=>"-6.256648,53.400534", "address"=>"Dublin", "roomtype"=>"One-Bedroom Apartment", "bedtype"=>"1 queen bed", "price"=>"149", "location_id"=>1},{"name"=>"Dublin beautiful stay, close to centre, university, business park, RDS", "rank"=>"NA", "location"=>"-6.228868,53.30097", "address"=>"Dublin", "roomtype"=>"Double or Twin Room", "bedtype"=>"1 full bed", "price"=>"244", "location_id"=>1},{"name"=>"The Gibson Hotel", "rank"=>"8.7", "location"=>"-6.22855871915817,53.3485371404209", "address"=>"Dublin City Centre, Dublin", "roomtype"=>"NA", "bedtype"=>"NA", "price"=>"SOLD OUT", "location_id"=>1}
    @scrappedHotels.each do |h|
      hotel = Hotel.new
      h.each do |key,value|
        if key == "name"
          hotel.name = value
        elsif key == "rank"
          hotel.rank = value
        elsif key == "location"
          hotel.coordinates = value
        elsif key == "address"
          hotel.address = value
        elsif key == "roomtype"
          hotel.roomtype = value
        elsif key == "bedtype"
          hotel.bedtype = value
        elsif key == "price"
          hotel.price = value
        elsif key == "location_id"
          hotel.location_id = value
        else
          break
        end
      end

      if Hotel.find_by_coordinates(hotel.coordinates)
        puts hotel.name
        puts "hotel already exixts"
      else
        hotel.save
        puts hotel.name
        puts "hotel added to the Hotels table"
      end
    end

  end




end
