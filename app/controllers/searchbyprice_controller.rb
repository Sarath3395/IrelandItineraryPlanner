require 'bookingscrapper'
require 'restaurantscrapper'
require 'time'

class SearchbypriceController < ApplicationController

	@@scrappedHotels = []
    @@dublinhotels =[]
    @@corkhotels = []
    @@galwayhotels =[]
    @@limerickhotels=[]
    @@belfasthotels= []
    @@newryhotels =[]
    @@originlocation
    @@destinationlocation

    def searchbyprice

    defaultUrl = "https://www.booking.com/searchresults.en-us.html?aid=397594&label=gog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB&sid=6426bb78f6fe60bf3b783451f500e2a1&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.html%3Faid%3D397594%3Blabel%3Dgog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB%3Bsid%3D6426bb78f6fe60bf3b783451f500e2a1%3Bsb_price_type%3Dtotal%26%3B&"
 	puts '--------------------------------------------------------------------------------'
 	puts '--------------------------------------------------------------------------------'
 	puts params.inspect 
 	puts '--------------------------------------------------------------------------------'
 	puts '--------------------------------------------------------------------------------'
    @scrappedHotels = []
    @dublinhotels =[]
    @corkhotels = []
    @galwayhotels =[]
    @limerickhotels=[]
    @belfasthotels= []
    @newryhotels =[]

    fromdatestr = params[:fromdate]
    todatestr = params[:todate]
    fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
    todate = Date.strptime(todatestr, '%Y-%m-%d')
    noofpersons = params[:noofpersons]
    noofrooms = params[:noofrooms]
    price = params[:price]

    #@@trip = TripController.new(fromdate,todate,noofpersons)
    #Itineraryplannerbyprice.tripcreater(fromdate,todate,noofpersons)
    #SearchbypriceController.itineraryprepare([fromdate,todate,noofpersons])
    trip = TripController.instance
    trip.fromdate=fromdate
    trip.todate=todate
    trip.noofpersons=noofpersons
    trip.price=0
    trip.elements=[]



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
    str16 = "nflt=uf%3D-1502554%3Buf%3D-1502950%3Buf%3D-1501986%3Buf%3D-1504189%3Buf%3D-2589607%3Buf%3D-2604058%3Bpri%3D#{price}%3B&"
    str17 = "b_h4u_keep_filters=&"
    str18 = "from_sf=1&"
    str19 = "selected_currency=EUR"

    @searchresultsstr = "From #{fromdatestr} to #{todatestr} for #{noofpersons} adults and  #{noofrooms} room(s) based on selected price"

    finalurl = defaultUrl+str1+str2+str3+str4+str5+str6+str7+str8+str9+str10+str11+str12+str13+str14+str15+str16+str17+str18

    result = BookingScrapper.scrape(finalurl)
    puts finalurl
    puts result
    #puts @scrappedHotels
    result.each_with_index do |val, index|
        val.store("fromdate", params[:fromdate])
        val.store("todate", params[:todate])
        val.store("noofpersons", params[:noofpersons])

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
        val["price"]= "#{temp}"
      end
      if(val["bedtype"]==nil)
        val["bedtype"] = "NA"
      end

    if(val["price"] != "SOLD OUT")    
      if(val["address"].include? "Dublin")
            @location = Location.find_by_name("Dublin")
            val.store("location_id", @location.id)
            @@dublinhotels << val
             @dublinhotels << val

      elsif (val["address"].include? "Galway")
            @location = Location.find_by_name("Galway")
            val.store("location_id", @location.id)
            @@galwayhotels << val
            @galwayhotels << val
       
      elsif (val["address"].include? "Cork")
            @location = Location.find_by_name("Cork")
            val.store("location_id", @location.id)
            @@corkhotels << val
            @corkhotels << val

      elsif (val["address"].include? "Limerick")
            @location = Location.find_by_name("Limerick")
            val.store("location_id", @location.id)
            @@limerickhotels << val
            @limerickhotels << val

      elsif (val["address"].include? "Belfast")
            @location = Location.find_by_name("Belfast")
            val.store("location_id", @location.id)
            @@belfasthotels << val
            @belfasthotels << val

      elsif (val["address"].include? "Newry")     
            @location = Location.find_by_name("Newry")
            val.store("location_id", @location.id)
            @@newryhotels << val
            @newryhotels << val
        end 


      @@scrappedHotels << val
      @scrappedHotels << val
        end
    end  

       puts @@scrappedHotels 
       if(current_user)
        @likedHotels=[]
        LikedHotel.find_each do |likedhotel|
             if(likedhotel.user_id == current_user.id)
            @hotel = Hotel.find(likedhotel.hotel_id)
            @likedHotels << @hotel
        end
        end

       @dublinhotels = SearchbypriceController.sortinghotels(@likedHotels,@dublinhotels)
       @@dublinhotels= @dublinhotels
       
       @galwayhotels = SearchbypriceController.sortinghotels(@likedHotels,@galwayhotels)
       @@galwayhotels= @galwayhotels

       @corkhotels = SearchbypriceController.sortinghotels(@likedHotels,@corkhotels)
       @@corkhotels= @corkhotels

       @limerickhotels = SearchbypriceController.sortinghotels(@likedHotels,@limerickhotels)
       @@limerickhotels= @limerickhotels

       @belfasthotels = SearchbypriceController.sortinghotels(@likedHotels,@belfasthotels)
       @@belfasthotels= @belfasthotels

       @newryhotels = SearchbypriceController.sortinghotels(@likedHotels,@newryhotels)
       @@newryhotels= @newryhotels
    end
    self.updatehotelstable
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
        if(current_user)
        @likedtransport=[]
        LikedTransport.find_each do |likedtransport|
             if(likedtransport.user_id == current_user.id)
            @transport = Transport.find(likedtransport.transport_id)
            @likedtransport << @transport
        end
        end

        @scrappedinwardtransport = SearchbypriceController.sortingtransport(@likedtransport,@scrappedinwardtransport)
        @scrappedoutwardtransport = SearchbypriceController.sortingtransport(@likedtransport,@scrappedoutwardtransport)
        end

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

        if(current_user)
        @likedrestaurant=[]
        LikedRestaurant.find_each do |likedRestaurant|
            if(likedRestaurant.user_id == current_user.id)
            @restaurant = Restaurant.find(likedRestaurant.restaurant_id)
            @likedrestaurant << @restaurant
        end
        end
        @scrappedrestaurant = SearchbypriceController.sortingrestaurant(@likedrestaurant,@scrappedrestaurant)
        end
self.updatetransporttable
self.updaterestauranttable
  end

def userpreference
    checkedtransoutedit = []
    checkedtransinedit = []
    checkedresedit =[]
    checkedtransout =params[:checkedtransout]
    checkedtransin =params[:checkedtransin]
    checkedres =params[:checkedres]
    hotelraw = params[:prefer][:hotel]
    hotel = eval(hotelraw)

    checkedtransout.each_with_index do |val, index|
        val = eval(val)
        checkedtransoutedit << val  
    end
    checkedtransin.each_with_index do |val, index|
        val = eval(val)
        checkedtransinedit << val  
    end
    checkedres.each_with_index do |val, index|
        val = eval(val)
        checkedresedit << val  
    end
 

        @hotel = Hotel.find_by_coordinates(hotel["location"])
        likedhotel = LikedHotel.new
        likedhotel.user_id = current_user.id
        likedhotel.hotel_id = @hotel.id
        if !LikedHotel.find_by(user_id: current_user.id, hotel_id: @hotel.id)
        likedhotel.save
        end
        @hotel.price=hotel["price"]

        #trip=SearchbypriceController.itineraryprepare(@hotel)
        #Itineraryplannerbyprice.tripadder(@hotel)
        basetrip = TripController.instance
        hoteltrip = TriphotelController.new(basetrip,@hotel)


     #  checkedtransoutedit.each_with_index do |val, index|
        @outtransport = Transport.find_by_name("#{@@originlocation.name}_to_#{@@destinationlocation.name}_"+checkedtransoutedit[0]["id"])
        outlikedtransport = LikedTransport.new
        outlikedtransport.user_id = current_user.id
        outlikedtransport.transport_id = @outtransport.id
        if !LikedTransport.find_by(user_id: current_user.id, transport_id: @outtransport.id)
            outlikedtransport.save
        end
        
      # end

       #checkedtransinedit.each_with_index do |val, index|
        @intransport = Transport.find_by_name("#{@@destinationlocation.name}_to_#{@@originlocation.name}_"+checkedtransinedit[0]["id"])
        inlikedtransport = LikedTransport.new
        inlikedtransport.user_id = current_user.id
        inlikedtransport.transport_id = @intransport.id
        if !LikedTransport.find_by(user_id: current_user.id, transport_id: @intransport.id)
            inlikedtransport.save
        end
        @outtransport.price = checkedtransoutedit[0]["price"]
        @intransport.price = checkedtransinedit[0]["price"]
        
        outwardtrip = TriptransportController.new(hoteltrip,@outtransport)
        
        inwardtrip = TriptransportController.new(outwardtrip,@intransport)

        #trip=SearchbypriceController.itineraryprepare(@outtransport)
        #trip= SearchbypriceController.itineraryprepare(@intransport)
        

        #Itineraryplannerbyprice.tripadder(@outtransport)
        #Itineraryplannerbyprice.tripadder(@intransport)
       #end

       #checkedresedit.each_with_index do |val, index|
        @restaurant = Restaurant.find_by(name: checkedresedit[0]["name"], location_id: @@destinationlocation.id)
        likedrestaurant = LikedRestaurant.new
        likedrestaurant.user_id = current_user.id
        likedrestaurant.restaurant_id = @restaurant.id
        if !LikedRestaurant.find_by(user_id: current_user.id, restaurant_id: @restaurant.id)
            likedrestaurant.save
        end
        
        finaltrip = TriprestaurantController.new(inwardtrip,@restaurant)
        #Itineraryplannerbyprice.tripadder(@restaurant)
        #trip =SearchbypriceController.itineraryprepare(@restaurant)
       #end

tripelements = finaltrip.elements

@fromdate = finaltrip.fromdate
@todate = finaltrip.todate
@noofpersons = finaltrip.noofpersons
@price = finaltrip.price.round(2)
puts "-----------------------------trip object. elements----------------------------------------------"
puts TripController.instance.inspect
puts "------------------------------------------------------------------------------------------"
@resultTransport =[]
@resultRestaurant=[]
tripelements.each_with_index do |val, index|
        if(val.class.name.eql? "Hotel")
            @resultHotel = val

        elsif(val.class.name.eql? "Transport")
            @resultTransport << val

        elsif(val.class.name.eql? "Restaurant")
            @resultRestaurant << val
        end    

   end 
end
 
  def self.sortinghotels(likedhotels,scrappedhotels)

       firstScrappedHotels=[]
       likedhotels.each_with_index do |val, index|
            scrappedhotels.each_with_index do |vale, indexw|
                    if((val.coordinates.eql? vale["location"]) && (val.name == vale["name"]))
                        firstScrappedHotels << vale
                        break
                    end
            end

       end
     remainScrappedHotels = scrappedhotels - firstScrappedHotels
       sortedScrappedhotels = firstScrappedHotels + remainScrappedHotels

       return sortedScrappedhotels
  end

    def self.sortingtransport(likedtransport,scrappedtransport)

       firstScrappedtransport=[]
            preferred = likedtransport.each_with_object(Hash.new(0)) { |trans1, trans2| trans2[trans1[:transporttype]] += 1 }
            preferredArr =preferred.sort_by{|k, v| v}.reverse
            preferredArr.each_with_index do |val, index|
            scrappedtransport.each_with_index do |vale, indexw|
                    if((val[0].eql? vale["when"]))
                        firstScrappedtransport << vale
                    end
            end
       end

     remainScrappedTransport = scrappedtransport - firstScrappedtransport
       sortedScrappedtransport = firstScrappedtransport + remainScrappedTransport

       return sortedScrappedtransport
  end

    def self.sortingrestaurant(likedRestaurant,scrappedrestaurant)

        preferredfortype = likedRestaurant.each_with_object(Hash.new(0)) { |rest1, rest2| rest2[rest1[:foodtype]] += 1 }
         preferredforcost = likedRestaurant.each_with_object(Hash.new(0)) { |rest1, rest2| rest2[rest1[:price]] += 1 }

         preferred = preferredfortype.merge(preferredforcost)

        preferredArr =preferred.sort_by{|k, v| v}.reverse

        preferredtypeArr =preferredfortype.sort_by{|k, v| v}.reverse
        preferredcostArr =preferredforcost.sort_by{|k, v| v}.reverse

        resultArr =[]
        sortingorderArr =[]
        scrappedrestaurant.each_with_index do |val, index|
        count=0
            preferredArr.each_with_index do |val1, index1|
            
                    if((val1[0].eql? val["type"]))
                        count+=val1[1]
                    elsif((val1[0].eql? val["economy"]))
                        count+=val1[1]
                    end

            end
                    output = Hash.new
                    output.store("score", count)
                    output.store("placement", index)
                    sortingorderArr << output

        end


    sortingorderArr= sortingorderArr.sort_by {|sorthash| sorthash["score"]}.reverse
    sortingorderArr.each_with_index do |val, index|
        resultArr << scrappedrestaurant[val["placement"]]
    end


       return resultArr
  end

  def updatehotelstable
    #tmp = @scrappedHotels.first()
    #tmp = {"name"=>"Cheap Accommodation close to Dublin city Center and Dublin Airport", "rank"=>"8.1", "location"=>"-6.256648,53.400534", "address"=>"Dublin", "roomtype"=>"One-Bedroom Apartment", "bedtype"=>"1 queen bed", "price"=>"149", "location_id"=>1},{"name"=>"Dublin beautiful stay, close to centre, university, business park, RDS", "rank"=>"NA", "location"=>"-6.228868,53.30097", "address"=>"Dublin", "roomtype"=>"Double or Twin Room", "bedtype"=>"1 full bed", "price"=>"244", "location_id"=>1},{"name"=>"The Gibson Hotel", "rank"=>"8.7", "location"=>"-6.22855871915817,53.3485371404209", "address"=>"Dublin City Centre, Dublin", "roomtype"=>"NA", "bedtype"=>"NA", "price"=>"SOLD OUT", "location_id"=>1}
    @scrappedHotels.each_with_index do |val, index|
        hotel = Hotel.new
        hotel.name = val["name"]
        hotel.rank = val["rank"]
        hotel.coordinates = val["location"]
        hotel.address = val["address"]
        hotel.roomtype = val["roomtype"]
        hotel.bedtype = val["bedtype"]
        hotel.price = val["price"]
        hotel.location_id = val["location_id"]

        if !Hotel.find_by(name: hotel.name, coordinates: hotel.coordinates)
         hotel.save
      end
      end
    
  end


def updaterestauranttable

    @scrappedrestaurant.each_with_index do |val, index|
      restaurant = Restaurant.new
        restaurant.name = val["name"]
        restaurant.foodtype = val["type"]
        restaurant.price = val["economy"]
        restaurant.location_id = @destinationlocation.id
         

        if !Restaurant.find_by(name: restaurant.name, location_id: @destinationlocation.id)
         if(!restaurant.name.include? "NA")
          restaurant.save  
          end 
        end
      end
end
  def updatetransporttable

    @scrappedoutwardtransport.each_with_index do |val, index|
      transport = Transport.new
        transport.origin = @originlocation.name
        transport.destination = @destinationlocation.name
        transport.departure = val["depart"]
        transport.arrival = val["arrival"]
        transport.name = "#{@originlocation.name}_to_#{@destinationlocation.name}_"+val["id"]
        transport.price = val["price"]
        transport.location_id = @destinationlocation.id
        transport.transporttype = val["when"]
   

        if !Transport.find_by_name(transport.name)
            transport.save   
        end
      end

        @scrappedinwardtransport.each_with_index do |val, index|
        transport = Transport.new
        transport.origin = @destinationlocation.name
        transport.destination = @originlocation.name
        transport.departure = val["depart"]
        transport.arrival = val["arrival"]
        transport.name = "#{@destinationlocation.name}_to_#{@originlocation.name}_"+val["id"]
        transport.price = val["price"]
        transport.location_id = @originlocation.id
        transport.transporttype = val["when"]
   
   
        if !Transport.find_by_name(transport.name)
          transport.save   
        end

      end
  end








end
