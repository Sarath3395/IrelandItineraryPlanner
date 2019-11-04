require 'recommendation'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :facebook]
  has_many :liked_hotels
  has_many :hotels, through: :liked_hotels

  has_many :liked_restaurants
  has_many :restaurants, through: :liked_restaurants

  has_many :liked_transports
  has_many :transports, through: :liked_transports

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  include Recommendation
end
