class WelcomeController < ApplicationController


	def homepage
		@hotels = Hotel.order("RANDOM()").limit(10)
		@restaurants = Restaurant.order("RANDOM()").limit(10)
		@transports = Transport.order("RANDOM()").limit(10)

		if( user_signed_in? )
			id = current_user.id
			@user = User.find(id)
			@user = User.find_by_id(current_user.id)


			@recommendedhotelsbycollab = Hash.new(0)
			collab = @user.recommend_hotels
			i =0
			collab.each do|key, value|

				if(i<3)
          @recommendedhotelsbycollab[key] = value
					i=i+1
				end
      end

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

				if (t <3)

					exst = LikedHotel.where(hotel_id: key.id, user_id: current_user.id)
					if(exst == [])
            @recommendedhotelsbytop[key] = value
						t=t+1
					end

				end
			end



			@recommendedrestaurantsbycollab = Hash.new(0)
			collab = @user.recommend_restaurants
			i =0
			collab.each do|key, value|

				if(i<3)
          @recommendedrestaurantsbycollab[key] = value
					i=i+1
				end
      end

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

				if (i <3)


          exst = LikedRestaurant.where(restaurant_id: key.id, user_id: current_user.id)
          if(exst == [])
            @recommendedrestaurantsbytop[key] = value
            i=i+1
          end

				end
			end


			@recommendedtrasnportsbycollab = Hash.new(0)
			collab = @user.recommend_transports
			i =0
			collab.each do|key, value|

				if(i<3)
          @recommendedtrasnportsbycollab[key] = value
					i=i+1
				end
      end


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

				if (i <3)



          exst = LikedTransport.where(transport_id: key.id, user_id: current_user.id)
          if(exst == [])
            @recommendedtrasnportsbytop[key] = value
            i=i+1
          end

				end
			end



		end
	end


end
