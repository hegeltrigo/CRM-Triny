json.extract! product, :id, :title, :hourly_rate, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
