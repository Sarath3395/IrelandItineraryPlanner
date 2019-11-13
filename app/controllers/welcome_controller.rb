class WelcomeController < ApplicationController


	def homepage
		@hotels = Hotel.order("RANDOM()").limit(10)
		@restaurants = Restaurant.order("RANDOM()").limit(10)
		@transports = Transport.order("RANDOM()").limit(10)

		if( user_signed_in? )
			id = current_user.id
			@user = User.find(id)
			@user = User.find_by_id(current_user.id)


			@recommendedhotels = Hash.new(0)
			collab = @user.recommend_hotels
			i =0
			collab.each do|key, value|

				if(i<3)
					@recommendedhotels[key] = value
					i=i+1
				end
			end
			@hotels = Hash.new(0)
			liked = LikedHotel.group(:hotel_id).count
			sortedlike = liked.sort_by{|key,value| value}.reverse
			sortedlike.each do|res|
				@hotels[Hotel.find_by_id(res[0])] = res[1]
			end
			toprated = @hotels
			i=0
			toprated.each do |key, value|

				if (i <3)

					i=i+1
					@recommendedhotels[key] = value
				end
			end



			@recommendedrestaurants = Hash.new(0)
			collab = @user.recommend_restaurants
			i =0
			collab.each do|key, value|

				if(i<3)
					@recommendedrestaurants[key] = value
					i=i+1
				end
			end
			@restaurants = Hash.new(0)
			liked = LikedRestaurant.group(:restaurant_id).count
			sortedlike = liked.sort_by{|key,value| value}.reverse
			sortedlike.each do|res|
				@restaurants[Restaurant.find_by_id(res[0])] = res[1]
			end
			toprated = @restaurants
			i=0
			toprated.each do |key, value|

				if (i <3)

					i=i+1
					@recommendedrestaurants[key] = value
				end
			end


			@recommendedtrasnports = Hash.new(0)
			collab = @user.recommend_transports
			i =0
			collab.each do|key, value|

				if(i<3)
					@recommendedtrasnports[key] = value
					i=i+1
				end
			end
			@transports = Hash.new(0)
			liked = LikedTransport.group(:transport_id).count
			sortedlike = liked.sort_by{|key,value| value}.reverse
			sortedlike.each do|res|
				@transports[Transport.find_by_id(res[0])] = res[1]
			end
			toprated = @transports
			i=0
			toprated.each do |key, value|

				if (i <3)

					i=i+1
					@recommendedtrasnports[key] = value
				end
			end



		end
	end


end
