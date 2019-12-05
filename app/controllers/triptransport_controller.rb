class TriptransportController < TripdecoratorController

	def initialize(trip, travel)
		super(trip)
		@added_element = travel
		@extra_price = travel["price"].to_f
	end



end
