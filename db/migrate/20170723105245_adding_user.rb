class AddingUser < ActiveRecord::Migration[5.1]
  def change
  	add_column :quoras,:user_id,:integer
  end
end
