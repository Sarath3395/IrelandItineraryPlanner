class LikedLocation < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :user_id, :location_id, presence: true

end
