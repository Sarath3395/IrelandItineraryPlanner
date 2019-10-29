module Recommendation

  def recommend_hotels # recommend hotels to a user
    # find all other users, equivalent to .where(‘id != ?’, self.id)
    other_users = self.class.all.where.not(id: self.id)
    # instantiate a new hash, set default value for any keys to 0
    recommended = Hash.new(0)
    # for each user of all other users
    other_users.each do |user|
      # find the hotels this user and another user both liked
      common_hotels = user.hotels & self.hotels
      # calculate the weight (recommendation rating)
      weight = common_hotels.size.to_f / user.hotels.size
      # add the extra hotels the other user liked
      ((user.hotels) - (common_hotels)).each do |hotel|
        # put the hotel along with the cumulative weight into hash
        recommended[hotel] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end

  def recommend_restaurants # recommend movies to a user
    # find all other users, equivalent to .where(‘id != ?’, self.id)
    other_users = self.class.all.where.not(id: self.id)
    # instantiate a new hash, set default value for any keys to 0
    recommended = Hash.new(0)
    # for each user of all other users
    other_users.each do |user|
      # find the restaurants this user and another user both liked
      common_restaurants = user.restaurants & self.restaurants
      # calculate the weight (recommendation rating)
      weight = common_restaurants.size.to_f / user.restaurants.size
      # add the extra restaurants the other user liked
      ((user.restaurants) - (common_restaurants)).each do |restaurant|
        # put the restaurant along with the cumulative weight into hash
        recommended[restaurant] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end

  def recommend_transports # recommend hotels to a user
    # find all other users, equivalent to .where(‘id != ?’, self.id)
    other_users = self.class.all.where.not(id: self.id)
    # instantiate a new hash, set default value for any keys to 0
    recommended = Hash.new(0)
    # for each user of all other users
    other_users.each do |user|
      # find the transports this user and another user both liked
      common_transports = user.transports & self.transports
      # calculate the weight (recommendation rating)
      weight = common_transports.size.to_f / user.transports.size
      # add the extra transports the other user liked
      ((user.transports) - (common_transports)).each do |transport|
        # put the transport along with the cumulative weight into hash
        recommended[transport] += weight
      end
    end
    # sort by weight in descending order
    sorted_recommended = recommended.sort_by { |key, value| value }.reverse
  end

end