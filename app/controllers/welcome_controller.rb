require 'hotel_recommendation'
require 'recommendation_result_generator'

class WelcomeController < ApplicationController
	def hotelcollabfilter
		id = current_user.id
		@user = User.find(id)
		@user = User.find_by_id(current_user.id)
		@recommendedhotelsbycollab = Hash.new(0)
		collab = @user.recommend_hotels
		i =0
		collab.each do|key, value|

			if(i<6)
				@recommendedhotelsbycollab[key] = value
				i=i+1
			end
		end
	end
	def hoteltopratedfilter
		@recommendedhotelsbytop = Hash.new(0)
		@hotels = Hash.new(0)
		liked = LikedHotel.group(:hotel_id).count
		sortedlike = liked.sort_by{|key,value| value}.reverse
		sortedlike.each do|res|
			@hotels[Hotel.find_by_id(res[0])] = res[1]
		end
		toprated = @hotels
		t=0
		toprated.each do |key, value|

			if (t <6)

				exst = LikedHotel.where(hotel_id: key.id, user_id: current_user.id)
				if(exst == [])
					@recommendedhotelsbytop[key] = value
					t=t+1
				end

			end
		end
	end
	def rescollabfilter
		id = current_user.id
		@user = User.find(id)
		@user = User.find_by_id(current_user.id)
		@recommendedrestaurantsbycollab = Hash.new(0)
		collab = @user.recommend_restaurants
		i =0
		collab.each do|key, value|

			if(i<6)
				@recommendedrestaurantsbycollab[key] = value
				i=i+1
			end
		end
	end
	def restopratedfilter
		@recommendedrestaurantsbytop = Hash.new(0)
		@restaurants = Hash.new(0)
		liked = LikedRestaurant.group(:restaurant_id).count
		sortedlike = liked.sort_by{|key,value| value}.reverse
		sortedlike.each do|res|
			@restaurants[Restaurant.find_by_id(res[0])] = res[1]
		end
		toprated = @restaurants
		i=0
		toprated.each do |key, value|

			if (i <6)


				exst = LikedRestaurant.where(restaurant_id: key.id, user_id: current_user.id)
				if(exst == [])
					@recommendedrestaurantsbytop[key] = value
					i=i+1
				end

			end
		end

	end

	def transcollabfilter
		id = current_user.id
		@user = User.find(id)
		@user = User.find_by_id(current_user.id)
		@recommendedtrasnportsbycollab = Hash.new(0)
		collab = @user.recommend_transports
		i =0
		collab.each do|key, value|

			if(i<6)
				@recommendedtrasnportsbycollab[key] = value
				i=i+1
			end
		end
	end

	def transtopratedfilter
		@recommendedtrasnportsbytop = Hash.new(0)
		@transports = Hash.new(0)
		liked = LikedTransport.group(:transport_id).count
		sortedlike = liked.sort_by{|key,value| value}.reverse
		sortedlike.each do|res|
			@transports[Transport.find_by_id(res[0])] = res[1]
		end
		toprated = @transports
		i=0
		toprated.each do |key, value|

			if (i <6)
				exst = LikedTransport.where(transport_id: key.id, user_id: current_user.id)
				if(exst == [])
					@recommendedtrasnportsbytop[key] = value
					i=i+1
				end

			end
		end
	end

	def homepage
		@hotels = Hotel.order("RANDOM()").limit(10)
		@restaurants = Restaurant.order("RANDOM()").limit(10)
		@transports = Transport.order("RANDOM()").limit(10)

		if( user_signed_in? )
			hotelnotexst = LikedHotel.where(user_id: current_user.id).empty?
      resnotexst = LikedRestaurant.where(user_id: current_user.id).empty?
			transnotext = LikedTransport.where(user_id: current_user.id).empty?

			if (hotelnotexst == true)
				puts "he did not have fav"
				hoteltopratedfilter
				@hotelrecommendationtype = "Recommended Hotels for You Based on MostFavorites"
				@recommendedhotels = @recommendedhotelsbytop

=begin
				@recommendedhotels = Hash.new(0)
				@recommendedhotels = RecommendationResultGenerator.new(RecommendationByMostLiked.new)
				@recommendedhotels.RecommendationResult(@recommendedhotelsbytop)
				puts"llllllllllllllllllll"
				puts @recommendedhotels
=end

			else
				puts "he has favorites"
				hotelcollabfilter
				@hotelrecommendationtype = "Recommended Hotels for You Based on Similarity with Other Users"
				@recommendedhotels = @recommendedhotelsbycollab
      end

      if (resnotexst == true)
        puts "he did not have fav"
        restopratedfilter
				@restaurantrecommendationtype = "Recommended Restaurants for You Based on MostFavorites"
				@recommendedrestaurants = @recommendedrestaurantsbytop
      else
        puts "he has favorites"
        rescollabfilter
				@restaurantrecommendationtype = "Recommended Restaurants for You Based on Similarity with Other Users"
				@recommendedrestaurants = @recommendedrestaurantsbycollab
			end

			if(transnotext == true)
				transtopratedfilter
				@transportrecommendationtype = "Recommended Transports for You Based on MostFavorites"
				@recommendedtransports = @recommendedtrasnportsbytop
			else
				transcollabfilter
				@transportrecommendationtype = "Recommended Transports for You Based on Similarity with Other Users"
				@recommendedtransports = @recommendedtrasnportsbycollab
			end

		end

	end


end
