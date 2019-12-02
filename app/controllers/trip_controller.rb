class TripController < ApplicationController

	def initialize(fromdate, todate, noofpersons)
		@fromdate = fromdate
		@todate = todate
		@noofpersons = noofpersons
		@price = 0
		@elements=[]
	end
	
	def price
		 return @price
	end
	def noofpersons
		return @noofpersons
	end	
	def fromdate
		return @fromdate
	end	
	def todate
		return @todate
	end	
	def elements
		return @elements
	end	
end
