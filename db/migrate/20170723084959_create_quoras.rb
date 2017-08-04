class CreateQuoras < ActiveRecord::Migration[5.1]
  def change
    create_table :quoras do |t|
      t.string :content
      t.integer :question_id

      t.timestamps
    end
  end
end
