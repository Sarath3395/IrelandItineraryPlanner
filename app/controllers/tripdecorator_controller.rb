class TripdecoratorController < ApplicationController

	def initialize(trip)
		@trip = trip
		@extra_price = 0
		@added_element= ""
	end
	def price
		 return @extra_price + @trip.price
	end
	def noofpersons
		return @trip.noofpersons
	end	
	def fromdate
		return @trip.fromdate
	end	
	def todate
		return @trip.todate
	end	

	def elements
		if(!@trip.elements.include?(@added_element))
		@trip.elements << @added_element
		end
		return @trip.elements
	end	

end
