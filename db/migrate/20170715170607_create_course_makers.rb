class CreateCourseMakers < ActiveRecord::Migration[5.1]
  def change
    create_table :course_makers do |t|
      t.references :course, foreign_key: true
      t.integer :pg_no
      t.string :pg_name
      t.text :section1
      t.text :section2
      t.text :section3
      t.text :section4

      t.timestamps
    end
  end
end
