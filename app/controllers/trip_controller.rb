require 'singleton'

class TripController < ApplicationController

include Singleton

attr_accessor :fromdate, :todate, :noofpersons, :price, :elements
	
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
