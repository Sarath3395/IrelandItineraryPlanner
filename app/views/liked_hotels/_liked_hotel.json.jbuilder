json.extract! liked_hotel, :id, :user_id, :hotel_id, :created_at, :updated_at
json.url liked_hotel_url(liked_hotel, format: :json)
