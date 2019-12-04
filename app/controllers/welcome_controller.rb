require 'recommendation_result_generator'


class WelcomeController < ApplicationController

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
=begin
				hoteltopratedfilter
				@hotelrecommendationtype = "Recommended Hotels for You Based on MostFavorites"
				@recommendedhotels = @recommendedhotelsbytop
=end

				#@recommendedhotels = Hash.new(0)
				res = RecommendationResultGenerator.new(RecommendationByTopratedHotels.new)
				res.recommendresult(current_user.id)
				@hotelrecommendationtype = "Recommended Hotels for #{current_user.name} Based on MostFavorites"
				@recommendedhotels = res.it_planner_recommendation.type(current_user.id)

			else
=begin
				puts "he has favorites"
				hotelcollabfilter
				@hotelrecommendationtype = "Recommended Hotels for You Based on Similarity with Other Users"
				@recommendedhotels = @recommendedhotelsbycollab
=end
				#@recommendedhotels = Hash.new(0)
				res = RecommendationResultGenerator.new(RecommendationByCollaborativeHotels.new)
				res.recommendresult(current_user.id)
				@hotelrecommendationtype = "Recommended Hotels for #{current_user.name} Based on Similarity with Other Users"
				@recommendedhotels = res.it_planner_recommendation.type(current_user.id)


      end

      if (resnotexst == true)
=begin
        puts "he did not have fav"
        restopratedfilter
				@restaurantrecommendationtype = "Recommended Restaurants for You Based on MostFavorites"
				@recommendedrestaurants = @recommendedrestaurantsbytop
=end
				res = RecommendationResultGenerator.new(RecommendationByTopratedRestaurants.new)
				res.recommendresult(current_user.id)
				@restaurantrecommendationtype = "Recommended Restaurants for #{current_user.name} Based on MostFavorites"
				@recommendedrestaurants = res.it_planner_recommendation.type(current_user.id)

      else
=begin
        puts "he has favorites"
        rescollabfilter
				@restaurantrecommendationtype = "Recommended Restaurants for You Based on Similarity with Other Users"
				@recommendedrestaurants = @recommendedrestaurantsbycollab
=end

				res = RecommendationResultGenerator.new(RecommendationByCollaborativeRestaurants.new)
				res.recommendresult(current_user.id)
				@restaurantrecommendationtype = "Recommended Restaurants for #{current_user.name} Based on Similarity with Other Users"
				@recommendedrestaurants = res.it_planner_recommendation.type(current_user.id)

			end

			if(transnotext == true)
=begin
				transtopratedfilter
				@transportrecommendationtype = "Recommended Transports for You Based on MostFavorites"
				@recommendedtransports = @recommendedtrasnportsbytop
=end
				res = RecommendationResultGenerator.new(RecommendationByTopratedTransports.new)
				res.recommendresult(current_user.id)
				@transportrecommendationtype = "Recommended Transports for #{current_user.name} Based on MostFavorites"
				@recommendedtransports = res.it_planner_recommendation.type(current_user.id)
			else
=begin
				transcollabfilter
				@transportrecommendationtype = "Recommended Transports for You Based on Similarity with Other Users"
				@recommendedtransports = @recommendedtrasnportsbycollab
=end
				res = RecommendationResultGenerator.new(RecommendationByCollaborativeTransports.new)
				res.recommendresult(current_user.id)
				@transportrecommendationtype = "Recommended Transports for #{current_user.name} Based on Similarity with Other Users"
				@recommendedtransports = res.it_planner_recommendation.type(current_user.id)
			end

		end

	end


end
