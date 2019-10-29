json.extract! liked_restaurant, :id, :user_id, :restaurant_id, :created_at, :updated_at
json.url liked_restaurant_url(liked_restaurant, format: :json)
