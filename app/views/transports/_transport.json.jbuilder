json.extract! transport, :id, :name, :type, :origin, :destination, :departure, :arrival, :price, :location_id, :created_at, :updated_at
json.url transport_url(transport, format: :json)
