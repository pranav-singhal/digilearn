class AddingAttributes < ActiveRecord::Migration[5.1]
  def change
  	add_column :carts, :seller_id, :integer
  	add_column :carts, :user_price, :float
	add_column :carts, :seller_price, :float
	add_column :carts, :status, :integer,:default => 0
  end
end
