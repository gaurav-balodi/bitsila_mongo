json.extract! restaurant, :id, :name, :url, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
