json.extract! user_order, :id, :user_id, :product_id, :quantity, :user_price_per_unit, :created_at, :updated_at
json.url user_order_url(user_order, format: :json)
