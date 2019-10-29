class LikedTransport < ApplicationRecord
  belongs_to :user
  belongs_to :transport
end
