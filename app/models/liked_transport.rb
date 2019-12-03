class LikedTransport < ApplicationRecord
  belongs_to :user
  belongs_to :transport
  validates :user_id, :transport_id, presence: true

end
