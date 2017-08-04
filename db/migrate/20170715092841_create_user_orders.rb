class CreateUserOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :user_orders do |t|
      t.references :user, foreign_key: true
      t.integer :product_id
      t.integer :quantity
      t.float :user_price_per_unit

      t.timestamps
    end
  end
end
