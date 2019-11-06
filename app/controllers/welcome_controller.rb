class WelcomeController < ApplicationController


	def homepage
		@hotels = Hotel.order("RANDOM()").limit(10)
		@restaurants = Restaurant.order("RANDOM()").limit(10)
		@transports = Transport.order("RANDOM()").limit(10)
		if( user_signed_in? )
			id = current_user.id
			@user = User.find(id)
		end
	end


end
