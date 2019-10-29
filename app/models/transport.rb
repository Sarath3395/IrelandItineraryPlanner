class Transport < ApplicationRecord
  belongs_to :location

  has_many :liked_transports
  has_many :users, through: :liked_transports
end
