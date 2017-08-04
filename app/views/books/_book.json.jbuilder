json.extract! book, :id, :seller_id, :name, :seller_price, :user_price, :qunatity_in_stock, :created_at, :updated_at
json.url book_url(book, format: :json)
