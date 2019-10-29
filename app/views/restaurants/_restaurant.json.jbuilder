json.extract! restaurant, :id, :name, :type, :price, :location_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
