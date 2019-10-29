require './lib/recommendation.rb'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :liked_hotels
  has_many :hotels, through: :liked_hotels

  has_many :liked_restaurants
  has_many :restaurants, through: :liked_restaurants

  has_many :liked_transports
  has_many :transports, through: :liked_transports

  include Recommendation
end
