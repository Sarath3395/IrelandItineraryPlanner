class LikedRestaurant < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :user_id, :restaurant_id, presence: true

end
