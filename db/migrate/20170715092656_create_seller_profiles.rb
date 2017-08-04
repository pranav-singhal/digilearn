class CreateSellerProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_profiles do |t|
      t.references :seller, foreign_key: true
      t.string :name
      t.string :address
      t.float :credit
      t.float :debit

      t.timestamps
    end
  end
end
