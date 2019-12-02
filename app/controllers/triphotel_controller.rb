class TriphotelController < TripdecoratorController

	def initialize(trip, hotel)
		super(trip)
		@added_element = hotel
		@extra_price = hotel.price.to_f
	end



end
