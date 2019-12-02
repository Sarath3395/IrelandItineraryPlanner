class TriprestaurantController < TripdecoratorController

	def initialize(trip, restaurant)
		super(trip)
		@added_element = restaurant
		@extra_price = 0
		calculateprice(restaurant)
	end

	def calculateprice(restaurant)
		range = {"cheap"=>10, "average"=>20, "expensive"=>30}
		
		price= range[restaurant.price]

		f_date = @trip.fromdate
		t_date = @trip.todate
		days = (t_date - f_date).to_i + 1

		@extra_price = @trip.noofpersons.to_f * price.to_f * 3 * days.to_f
		puts "--------------------------------------------extra_price----------------------------------------------------"
		puts @extra_price.inspect

	end	


end
