class Restaurant < ApplicationRecord
  belongs_to :location

  has_many :liked_restaurants
  has_many :users, through: :liked_restaurants
  validates :name,  presence: true

end
