class CreateSellerOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_orders do |t|
      t.references :seller, foreign_key: true
      t.integer :product_id
      t.integer :qunatity
      t.float :seller_price_per_unit

      t.timestamps
    end
  end
end
