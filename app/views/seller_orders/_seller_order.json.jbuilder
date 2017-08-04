json.extract! seller_order, :id, :seller_id, :product_id, :qunatity, :seller_price_per_unit, :created_at, :updated_at
json.url seller_order_url(seller_order, format: :json)
