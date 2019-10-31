class WelcomeController < ApplicationController

	def homepage
		@hotels = Hotel.all
		@restaurants = Restaurant.all
		@transports = Transport.all
		if( user_signed_in? )
			id = current_user.id
			@user = User.find(id)
		end
	end
end
