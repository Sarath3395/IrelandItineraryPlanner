class LikedHotel < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
end
