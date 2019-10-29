json.extract! liked_location, :id, :user_id, :location_id, :created_at, :updated_at
json.url liked_location_url(liked_location, format: :json)
