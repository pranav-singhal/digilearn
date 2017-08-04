json.extract! seller_profile, :id, :seller_id, :name, :address, :credit, :debit, :created_at, :updated_at
json.url seller_profile_url(seller_profile, format: :json)
