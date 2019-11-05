require 'BookingScrapper'

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


      fromdate = params[:fromdate]
      todate =params[:todate]
      noofpersons = params[:noofpersons]
      noofrooms = params[:noofrooms]
      priceplace = params[:priceplace]
      @hotels = Hotel.where(fromdate: fromdate, todate: todate, noofperson: noofpersons, noofrooms: noofrooms, location_id: priceplace)
      @restaurants = Restaurant.where(location_id: priceplace)
      @transports = Transport.where(departure: fromdate, arrival: todate,location_id: priceplace)
      #@records_array = ActiveRecord::Base.connection.execute(sql)
        # #@res = Hotel.where(fromdate: fromdate, todate: "2019-10-29 15:52:00", noofperson: "2", noofrooms: "1", location_id: "2")
      #Hotel.all( :cond => ["created_at >= ? AND created_at <= ?", params[:start_date], params[:end_date]])

    end

    def searchbyprice

      defaultUrl = "https://www.booking.com/searchresults.en-us.html?aid=397594&label=gog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB&sid=6426bb78f6fe60bf3b783451f500e2a1&sb=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.html%3Faid%3D397594%3Blabel%3Dgog235jc-1DCAEoggI46AdIM1gDaGmIAQGYATG4ARfIAQzYAQPoAQH4AQKIAgGoAgO4AvDOhe4FwAIB%3Bsid%3D6426bb78f6fe60bf3b783451f500e2a1%3Bsb_price_type%3Dtotal%26%3B&"

      fromdatestr = params[:search][:fromdate]
      todatestr = params[:search][:todate]
      fromdate = Date.strptime(fromdatestr, '%Y-%m-%d')
      todate = Date.strptime(todatestr, '%Y-%m-%d')
      noofpersons = params[:noofpersons]
      noofrooms = params[:noofrooms]

      str1 = "ss=Dublin&"
      str2 = "is_ski_area=0&"
      str3 = "ssne=Dublin&"
      str4 = "ssne_untouched=Dublin&"
      str5 = "dest_id=-1502554&"
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
        @scrappedHotels << val

        #puts "#{val} => #{index}"
      end
      puts"before------------------"
      savehotel
      puts"after------------------"
      fromdate = params[:fromdate]
      todate =params[:todate]
      noofpersons = params[:noofpersons]
      noofrooms = params[:noofrooms]
      priceplace = params[:priceplace]
      @hotels = Hotel.where(fromdate: fromdate, todate: todate, noofperson: noofpersons, noofrooms: noofrooms, price: priceplace)
      @restaurants = Restaurant.where(price: priceplace)
      @transports = Transport.where(departure: fromdate, arrival: todate,price: priceplace)


    end
  def savehotel



puts"insidefun---------------------"
@scrappedHotels.each do |h|
puts h
puts"end====================fun"
end






  end
  end
