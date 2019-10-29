class Hotel < ApplicationRecord
  belongs_to :location

  has_many :liked_hotels
  has_many :users, through: :liked_hotels
end
