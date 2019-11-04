  class SearchController < ApplicationController

    def searchmethod
      puts "Print inside search controller"
      searchtype = params[:search][:searchtype]
      puts searchtype
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

      fromdate = params[:fromdate]
      todate =params[:todate]
      noofpersons = params[:noofpersons]
      noofrooms = params[:noofrooms]
      priceplace = params[:priceplace]
      @hotels = Hotel.where(fromdate: fromdate, todate: todate, noofperson: noofpersons, noofrooms: noofrooms, price: priceplace)
      @restaurants = Restaurant.where(price: priceplace)
      @transports = Transport.where(departure: fromdate, arrival: todate,price: priceplace)

    end
  end
