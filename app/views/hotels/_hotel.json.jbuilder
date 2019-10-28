json.extract! hotel, :id, :name, :roomtype, :fromdate, :coordinates, :address, :todate, :price, :noofrooms, :noofperson, :bedtype, :location_id, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
