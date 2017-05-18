json.extract! restaurant, :id, :name, :desc, :addr_1, :addr_2, :addr_city, :addr_code, :addr_state, :addr_country, :phone_1, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
