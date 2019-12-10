require 'bookingscrapper'
require 'transportscrapper'
require 'restaurantscrapper'
require './lib/ipinvestigator'

class SearchController < ApplicationController

  def searchmethod

    if (params[:commit] == 'Search' && (params[:search][:fromdate].length != 0 && params[:search][:todate].length != 0) && Ipinvestigator.checkip )

      search_form = Hash.new
      search_form.store("fromdate", params[:search][:fromdate])
      search_form.store("todate", params[:search][:todate])
      search_form.store("noofpersons", params[:search][:noofpersons])
      search_form.store("noofrooms", params[:search][:noofrooms])
      search_form.store("searchtype", params[:search][:searchtype])
      search_form.store("price", params[:search][:price])
      search_form.store("place", params[:search][:place])


      searchtype = params[:search][:searchtype]


      if(searchtype.eql? "searchbyprice")
        puts "Print inside search by price controller"
        #SearchByPriceController.searchbyprice(params)
        redirect_to searchbyprice_path(params: search_form)
        #redirect_to :controller => 'search_by_price', :action => 'searchbyprice'
        #redirect_to searchbyprice_path(request.parameters.except(:authenticity_token, :controller, :action, :utf8, :commit)

      elsif(searchtype.eql? "searchbyplace")
        puts "Print inside search by place controller"
        self.searchbylocation

      end

    else
      redirect_to root_path
    end


  end
  def searchbylocation

    defaultUrl = "https://www.booking.com/searchresults.en-us.html?aid=397594&label=gog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB&sid=6426bb78f6fe60bf3b783451f500e2a1&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.html%3Faid%3D397594%3Blabel%3Dgog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB%3Bsid%3D6426bb78f6fe60bf3b783451f500e2a1%3Bsb_price_type%3Dtotal%26%3B&"

    fromdatestr = params[:search][:fromdate]
    todatestr = params[:search][:todate]
    fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
    todate = Date.strptime(todatestr, '%Y-%m-%d')
    noofpersons = params[:search][:noofpersons]
    noofrooms = params[:search][:noofrooms]
    location_scrapperid = params[:search][:place]
    @searchresultsstr = "From #{fromdatestr} to #{todatestr} for #{noofpersons} adults and  #{noofrooms} room(s) based on selected location"
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

      val.store("location_id", Location.find_by_scrapper_id(location_scrapperid).id)
      puts"sssssssssssssssssssssssssssssssssssss"
      puts val["location_id"]
      @scrappedHotels << val

      #puts "#{val} => #{index}"
    end

    puts @scrappedHotels
    updatehotelstable
    puts "----------------------------------bef"
    searchrestaurants
    serchtrasnport
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
  def  searchrestaurants
    @scrappedrestaurant = []
    location_scrapperid = params[:search][:place]

    #@@destinationlocation = Location.find(destination_id)
    @records = Hash.new(0)
    @records = Location.where(:scrapper_id => location_scrapperid)


    puts "=======================================rec"
    puts @records.ids
    rid = @records.ids
    @restau = Location.find_by_id(rid)
    puts "resssssssssssssssssssssssssssssssssssssss"
    puts @restau.restscrapper_id

    restdefaulturl = "https://www.tripadvisor.ie/Restaurants-#{@restau.restscrapper_id}"
    restaurants = RestaurantScrapper.scrape(restdefaulturl)

    puts restaurants

    restaurants.each_with_index do |val, index|

      if(val["range"].include? "1")
        val.store("economy", "cheap")
      elsif((val["range"].include? "2" )|| (val["range"].include? "3"))
        val.store("economy", "average")
      elsif((val["range"].include? "4") || (val["range"].include? "5"))
        val.store("economy", "expensive")
      end
      if val["name"]
        @scrappedrestaurant << val
      end


    end

   puts "rekkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"
    puts @scrappedrestaurant
    @scrappedrestaurant

    updaterestauranttable
  end
  def updaterestauranttable

    @scrappedrestaurant.each_with_index do |val, index|
      restaurant = Restaurant.new
      restaurant.name = val["name"]
      restaurant.foodtype = val["type"]
      restaurant.price = val["economy"]
      restaurant.location_id = @restau.id


      if !Restaurant.find_by(name: restaurant.name, location_id: @restau.id)
        puts "-------------------------------------saved Restaurant details-----------------------------------"
        puts "-----------------------------------------------------------------------------------------------"
        puts restaurant.inspect
        puts "-----------------------------------------------------------------------------------------------"
        puts "-----------------------------------------------------------------------------------------------"
        if(!restaurant.name.include? "NA")
          restaurant.save
        end
      end
    end
  end

  def serchtrasnport
    @scrappedoutwardtransport = []
    @scrappedinwardtransport = []



    origin_id = params[:search][:fromplace]
    destination_id = params[:search][:place]
    fromlctn = Location.where(:scrapper_id => origin_id)
    tolctb = Location.where(:scrapper_id => destination_id)

    @fromlctnid = fromlctn.ids
    @tocltnid = tolctb.ids


    @originlocation = Location.find_by_id(@fromlctnid)
    @destinationlocation = Location.find_by_id(@tocltnid)

    fromdatestr = params[:search][:fromdate]
    todatestr = params[:search][:todate]
    fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
    todate = Date.strptime(todatestr, '%Y-%m-%d')
    noofpersons = params[:search][:noofpersons]

    onwarddate = fromdate.day
    onwardmonth = Date::ABBR_MONTHNAMES[fromdate.month]
    onwardyear = fromdate.year

    returndate = todate.day
    returnmonth = Date::ABBR_MONTHNAMES[todate.month]
    returnyear = todate.year



    defaultUrl = "https://national.buseireann.ie/?"
    str1 = "originStop=#{@originlocation.transcrapper_id}&"
    str2 = "destinationstop=#{@destinationlocation.transcrapper_id}&"
    str3 = "ticketType=2&"
    str4 = "departdate=#{onwarddate}-#{onwardmonth}-#{onwardyear}&"
    str5 = "returndate=#{returndate}-#{returnmonth}-#{returnyear}&"
    str6 = "adult=#{noofpersons}&"
    str7 = "child=0&"
    str8 = "student=0&"
    str9 = "family=0"


    finalurl = defaultUrl+str1+str2+str3+str4+str5+str6+str7+str8+str9
    result = TransportScrapper.scrape(finalurl)
    puts "-----------------------------------result of transportscrapper-----------------------------------"
    puts "-------------------------------------------------------------------------------------------------"
    puts result
    puts "-------------------------------------------------------------------------------------------------"
    puts "-------------------------------------------------------------------------------------------------"
    outward = result["outward"]
    inward = result["return"]

    outward.each_with_index do |val, index|
      departtime= Time.parse(val["depart"])
      if(departtime >= Time.parse("00:00") && departtime < Time.parse("04:00"))
        val.store("when", "mid night")
      elsif(departtime >= Time.parse("04:00") && departtime < Time.parse("08:00"))
        val.store("when", "early morning")
      elsif(departtime >= Time.parse("08:00") && departtime < Time.parse("12:00"))
        val.store("when", "late morning")
      elsif(departtime >= Time.parse("12:00") && departtime < Time.parse("16:00"))
        val.store("when", "after noon")
      elsif(departtime >= Time.parse("16:00") && departtime < Time.parse("20:00"))
        val.store("when", "evening")
      elsif(departtime >= Time.parse("20:00") && departtime < Time.parse("24:00"))
        val.store("when", "night")
      end
      @scrappedoutwardtransport << val
    end

    inward.each_with_index do |val, index|

      departtime= Time.parse(val["depart"])
      if(departtime >= Time.parse("00:00") && departtime < Time.parse("04:00"))
        val.store("when", "mid night")
      elsif(departtime >= Time.parse("04:00") && departtime < Time.parse("08:00"))
        val.store("when", "early morning")
      elsif(departtime >= Time.parse("08:00") && departtime < Time.parse("12:00"))
        val.store("when", "late morning")
      elsif(departtime >= Time.parse("12:00") && departtime < Time.parse("16:00"))
        val.store("when", "after noon")
      elsif(departtime >= Time.parse("16:00") && departtime < Time.parse("20:00"))
        val.store("when", "evening")
      elsif(departtime >= Time.parse("20:00") && departtime < Time.parse("24:00"))
        val.store("when", "night")
      end
      @scrappedinwardtransport << val
    end

    puts "-----------------------------------editied result of transportscrapper-----------------------------------"
    puts "-------------------------------------------------------------------------------------------------"
    puts @scrappedinwardtransport.inspect
    puts @scrappedoutwardtransport.inspect
    puts "-------------------------------------------------------------------------------------------------"
    puts "-------------------------------------------------------------------------------------------------"



    @scrappedinwardtransport
    @scrappedoutwardtransport




  end

  def searchtransportrestaurant

    @scrappedoutwardtransport = []
    @scrappedinwardtransport = []
    @scrappedrestaurant = []

    origin_id = params[:search][:origin]
    destination_id = params[:search][:destination]
    indexofarray = params[:search][:indexofarray]
    indexofarray= indexofarray.to_i
    @@originlocation = Location.find(origin_id)
    @@destinationlocation = Location.find(destination_id)
    @originlocation = @@originlocation
    @destinationlocation = @@destinationlocation
    if(@destinationlocation.name.include? "Dublin")
      @hotel = @@dublinhotels[indexofarray]
    elsif(@destinationlocation.name.include? "Galway")
      @hotel = @@galwayhotels[indexofarray]
    elsif(@destinationlocation.name.include? "Cork")
      @hotel = @@corkhotels[indexofarray]
    elsif(@destinationlocation.name.include? "Limerick")
      @hotel = @@limerickhotels[indexofarray]
    elsif(@destinationlocation.name.include? "Belfast")
      @hotel = @@belfasthotels[indexofarray]
    elsif(@destinationlocation.name.include? "Newry")
      @hotel = @@newryhotels[indexofarray]
    end


    fromdatestr = @hotel["fromdate"]
    todatestr = @hotel["todate"]
    fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
    todate = Date.strptime(todatestr, '%Y-%m-%d')
    noofpersons = @hotel["noofpersons"]

    onwarddate = fromdate.day
    onwardmonth = Date::ABBR_MONTHNAMES[fromdate.month]
    onwardyear = fromdate.year

    returndate = todate.day
    returnmonth = Date::ABBR_MONTHNAMES[todate.month]
    returnyear = todate.year



    defaultUrl = "https://national.buseireann.ie/?"
    str1 = "originStop=#{@originlocation.transcrapper_id}&"
    str2 = "destinationstop=#{@destinationlocation.transcrapper_id}&"
    str3 = "ticketType=2&"
    str4 = "departdate=#{onwarddate}-#{onwardmonth}-#{onwardyear}&"
    str5 = "returndate=#{returndate}-#{returnmonth}-#{returnyear}&"
    str6 = "adult=#{noofpersons}&"
    str7 = "child=0&"
    str8 = "student=0&"
    str9 = "family=0"


    finalurl = defaultUrl+str1+str2+str3+str4+str5+str6+str7+str8+str9
    result = TransportScrapper.scrape(finalurl)
    puts "-----------------------------------result of transportscrapper-----------------------------------"
    puts "-------------------------------------------------------------------------------------------------"
    puts result
    puts "-------------------------------------------------------------------------------------------------"
    puts "-------------------------------------------------------------------------------------------------"
    outward = result["outward"]
    inward = result["return"]

    outward.each_with_index do |val, index|
      departtime= Time.parse(val["depart"])
      if(departtime >= Time.parse("00:00") && departtime < Time.parse("04:00"))
        val.store("when", "mid night")
      elsif(departtime >= Time.parse("04:00") && departtime < Time.parse("08:00"))
        val.store("when", "early morning")
      elsif(departtime >= Time.parse("08:00") && departtime < Time.parse("12:00"))
        val.store("when", "late morning")
      elsif(departtime >= Time.parse("12:00") && departtime < Time.parse("16:00"))
        val.store("when", "after noon")
      elsif(departtime >= Time.parse("16:00") && departtime < Time.parse("20:00"))
        val.store("when", "evening")
      elsif(departtime >= Time.parse("20:00") && departtime < Time.parse("24:00"))
        val.store("when", "night")
      end
      @scrappedoutwardtransport << val
    end

    inward.each_with_index do |val, index|

      departtime= Time.parse(val["depart"])
      if(departtime >= Time.parse("00:00") && departtime < Time.parse("04:00"))
        val.store("when", "mid night")
      elsif(departtime >= Time.parse("04:00") && departtime < Time.parse("08:00"))
        val.store("when", "early morning")
      elsif(departtime >= Time.parse("08:00") && departtime < Time.parse("12:00"))
        val.store("when", "late morning")
      elsif(departtime >= Time.parse("12:00") && departtime < Time.parse("16:00"))
        val.store("when", "after noon")
      elsif(departtime >= Time.parse("16:00") && departtime < Time.parse("20:00"))
        val.store("when", "evening")
      elsif(departtime >= Time.parse("20:00") && departtime < Time.parse("24:00"))
        val.store("when", "night")
      end
      @scrappedinwardtransport << val
    end

    puts "-----------------------------------editied result of transportscrapper-----------------------------------"
    puts "-------------------------------------------------------------------------------------------------"
    puts @scrappedinwardtransport.inspect
    puts @scrappedoutwardtransport.inspect
    puts "-------------------------------------------------------------------------------------------------"
    puts "-------------------------------------------------------------------------------------------------"

    @likedtransport=[]
    LikedTransport.find_each do |likedtransport|
      @transport = Transport.find(likedtransport.transport_id)
      @likedtransport << @transport
    end

    @scrappedinwardtransport = self.sortingtransport(@likedtransport,@scrappedinwardtransport)
    @scrappedoutwardtransport = self.sortingtransport(@likedtransport,@scrappedoutwardtransport)


    restdefaulturl = "https://www.tripadvisor.ie/Restaurants-#{@destinationlocation.restscrapper_id}"
    restaurants = RestaurantScrapper.scrape(restdefaulturl)

    puts restaurants

    restaurants.each_with_index do |val, index|

      if(val["range"].include? "1")
        val.store("economy", "cheap")
      elsif((val["range"].include? "2" )|| (val["range"].include? "3"))
        val.store("economy", "average")
      elsif((val["range"].include? "4") || (val["range"].include? "5"))
        val.store("economy", "expensive")
      end
      if val["name"]
        @scrappedrestaurant << val
      end


    end

    @likedrestaurant=[]
    LikedRestaurant.find_each do |likedRestaurant|
      @restaurant = Restaurant.find(likedRestaurant.restaurant_id)
      @likedrestaurant << @restaurant
    end
    @scrappedrestaurant = self.sortingrestaurant(@likedrestaurant,@scrappedrestaurant)

    self.updatetransporttable
    self.updaterestauranttable


  end

end
