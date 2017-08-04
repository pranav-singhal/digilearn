class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.references :seller, foreign_key: true
      t.string :name
      t.float :seller_price
      t.float :user_price
      t.integer :qunatity_in_stock

      t.timestamps
    end
  end
end
